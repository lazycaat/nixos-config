{
  inputs,
  self,
  ...
}: let

  inherit (inputs.nixpkgs.lib) nixosSystem;
  inherit (inputs.nix-on-droid.lib) nixOnDroidConfiguration;

  specialArgs = {inherit inputs self;};
in {
  flake = {
    
    # NixOS configurations
    nixosConfigurations = {

      ## qemu virtual machine
      machine1 = nixosSystem {
        inherit specialArgs;
        system = "x86_64-linux";
        modules = [ ./machine1 ];
      };

    };

    # Nix-On-Droid configurations
    nixOnDroidConfigurations = {

      android1 = nixOnDroidConfiguration {
        system.stateVersion = "23.11";
        modules = [ ./android1 ];
      };

    };

  };
}
