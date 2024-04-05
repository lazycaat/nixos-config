{
  inputs,
  self,
  ...
}: let

  inherit (inputs.nixpkgs.lib) nixosSystem;
  inherit (inputs.nix-on-droid.lib) nixOnDroidConfiguration;

  specialArgs = {inherit inputs self;};

  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;

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
    nixOnDroidConfiguration = {

      android1 = nixOnDroidConfiguration {
        inherit specialArgs pkgs;
        system = "aarch64-linux";
        modules = [ ./android1 ];
      };

    };

  };
}
