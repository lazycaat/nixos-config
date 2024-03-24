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

  kernelPackages = pkgs.linuxPackages_latest_hardened;
  
}
