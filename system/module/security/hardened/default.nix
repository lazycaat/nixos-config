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
  # need for graphene malloc
  networking.useDHCP = false;

  boot.kernelPackages = pkgs.linuxPackages_hardened;
  
}
