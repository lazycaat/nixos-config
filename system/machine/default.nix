{
  inputs,
  self,
  ...
}: let
  inherit (inputs.nixpkgs.lib) nixosSystem;
  specialArgs = {inherit inputs self;};

in {

  # NixOS configurations
  flake.nixosConfigurations = {

    machine1 = nixosSystem {
      inherit specialArgs;
      system = "x86_64-linux";
      stateVersion = "23.11"; # only change this if you know what you are doing.

      modules = [
        ./machine1
      ];
    };

  };

}
