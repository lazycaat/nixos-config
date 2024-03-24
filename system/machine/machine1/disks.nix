{
  inputs,
  self,
  ...
}:

{

  imports = [
    inputs.disko.nixosModules.default
    (import "${self}/system/module/module/disko/btrfs-gpt.nix" { device = "/dev/vda"; })
  ];

}
