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




  ];

  system.stateVersion = "23.11";

}
