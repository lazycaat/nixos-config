{
  self,
  ...
}: let

  user = "${self}/home/user"

in {
  imports = [


    # for this machine
    ./hardware-configuration.nix
    ./disks.nix


    # users
    "${self}/home/user/root"
    "${self}/home/user/user1"


    # modules
    "${self}/system/module/module/disko"
    "${self}/system/module/module/impermanence"
    "${self}/system/module/module/impermanence/btrfs.nix"
    "${self}/system/module/module/stylix"


    # security
    "${self}/system/module/security/audit"
    # "${self}/system/module/security/auth"
    "${self}/system/module/security/firewall"
    "${self}/system/module/security/hardened"


    # services
    "${self}/system/module/services/zram"
    "${self}/system/module/services/ananicy"
    "${self}/system/module/services/fwupd"
    "${self}/system/module/services/ksm"
    "${self}/system/module/services/powertop"
    "${self}/system/module/services/auto-cpufreq"

    # system
    "${self}/system/module/system/base-apps"
    "${self}/system/module/system/documentation"
    "${self}/system/module/system/localisation"
    "${self}/system/module/system/nix"
    "${self}/system/module/system/users"


  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

}
