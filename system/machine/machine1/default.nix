{
  pkgs,
  lib,
  modulesPath,
  inputs,
  self,
  ...
}:

{
  imports = [

    # for this machine
    ./hardware-configuration.nix

    # users
    "${self}/home/user/root"
    "${self}/home/user/user1"

    # modules
    "${self}/system/module/nix"
    "${self}/system/module/stylix"

    # flake modules
    (modulesPath + "/profiles/hardened.nix")
    inputs.impermanence.nixosModules.impermanence
    inputs.disko.nixosModules.default
    (import "${self}/system/module/disko/disko.nix" { device = "/dev/vda"; })
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.initrd.systemd.enable = true;
  
  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    curl
    yazi
    ranger
    helix
    neofetch
  ];

  boot.initrd.postDeviceCommands = lib.mkAfter ''
    mkdir /btrfs_tmp
    mount /dev/root_vg/root /btrfs_tmp
    if [[ -e /btrfs_tmp/root ]]; then
        mkdir -p /btrfs_tmp/old_roots
        timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
        mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
    fi

    delete_subvolume_recursively() {
        IFS=$'\n'
        for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
            delete_subvolume_recursively "/btrfs_tmp/$i"
        done
        btrfs subvolume delete "$1"
    }

    for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
        delete_subvolume_recursively "$i"
    done

    btrfs subvolume create /btrfs_tmp/root
    umount /btrfs_tmp
  '';

  fileSystems."/persist".neededForBoot = true;

  # 172 request
  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      # "/var/log"
    ];
  };

}
