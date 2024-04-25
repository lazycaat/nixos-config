{
  modulesPath,
  self,
  ...
}: let

  module = "${self}/system/module/module";
  security = "${self}/system/module/security";
  service = "${self}/system/module/service";
  system = "${self}/system/module/system";

in {

  imports = [

    # for this machine
    "${modulesPath}/installer/cd-dvd/installation-cd-graphical-calamares-gnome.nix"

    # modules
    # "${module}/stylix"


    # security
    "${security}/audit"
    "${security}/dns"


    # service
    "${service}/zram"
    "${service}/ananicy"
    "${service}/fwupd"
    "${service}/ksm"
    "${service}/powertop"

    # system
    "${system}/base-apps"
    "${system}/documentation/min.nix"
    "${system}/localisation"
    "${system}/nix"
    "${system}/users"

  ];

  nixpkgs.hostPlatform = "x86_64-linux";


}
