{
  pkgs,
  modulesPath,
  ...
}:

{

  imports = [
    (modulesPath + "/profiles/hardened.nix")
  ];

  environment.memoryAllocator.provider = "graphene-hardened";  

  boot.kernelPackages = pkgs.linuxPackages_hardened;
  
}
