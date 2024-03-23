{
  inputs,
  ...
}:

{

  # NixOS configurations
  parts.nixosConfigurations = {

    machine1 = {
      system = "x86_64-linux";
      stateVersion = "23.11"; # only change this if you know what you are doing.

      specialArgs = { inherit inputs; };
      modules = [
        ./machine1
      ];
    };

  };

}
