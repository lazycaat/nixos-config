{
  self,
  ...
}: let

  user = "${self}/home/user";
  module = "${self}/system/module/module";
  security = "${self}/system/module/security";
  service = "${self}/system/module/service";
  system = "${self}/system/module/system";

in {
  imports = [


    # for this machine
    ./hardware-configuration.nix
    ./disks.nix


    # users
    "${user}/root"
    "${user}/user1"


    # modules
    "${module}/impermanence"
    "${module}/impermanence/btrfs.nix"
    "${module}/stylix"


    # security
    "${security}/audit"
    # "${security}/auth"
    "${security}/firewall"
    "${security}/hardened"


    # service
    "${service}/zram"
    "${service}/ananicy"
    "${service}/fwupd"
    "${service}/ksm"
    "${service}/powertop"
    "${service}/auto-cpufreq"

    # system
    "${system}/base-apps"
    "${system}/documentation"
    "${system}/localisation"
    "${system}/nix"
    "${system}/users"


  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

}
