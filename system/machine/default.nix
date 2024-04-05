{
  inputs,
  self,
  ...
}: let

  inherit (inputs.nixpkgs.lib) nixosSystem;
  inherit (inputs.nix-on-droid.lib) nixOnDroidConfiguration;

  specialArgs = {inherit inputs self;};

in {

  # NixOS configurations
  flake.nixosConfigurations = {

    # qemu virtual machine
    machine1 = nixosSystem {
      inherit specialArgs;
      system = "x86_64-linux";
      modules = [ ./machine1 ];
    };

  };

  # Nix-On-Droid configurations
  flake.nixOnDroidConfiguration = {

    # qemu virtual machine
    android1 = nixOnDroidConfiguration {
      modules = [ ./android1 ];
    };

  };

}
