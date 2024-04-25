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

      ## first real laptop
      machine2 = nixosSystem {
        inherit specialArgs;
        system = "x86_64-linux";
        modules = [ ./machine2 ];
      };

      ## custom iso
      iso-gui = nixosSystem {
        inherit specialArgs;
        system = "x86_64-linux";
        modules = [ ./iso-gui ];
      };


    };

    # Nix-On-Droid configurations
    nixOnDroidConfigurations = {

      android1 = nixOnDroidConfiguration {
        modules = [ ./android1 ];
      };

    };

  };
}
