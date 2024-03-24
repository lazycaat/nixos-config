{
  inputs,
  self,
  ...
}:

{

  imports = [
    inputs.disko.nixosModules.default
    (import "${self}/system/module/disko/disko.nix" { device = "/dev/vda"; })
  ];

}
