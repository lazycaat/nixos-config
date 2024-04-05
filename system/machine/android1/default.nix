{
  inputs,
  config,
  lib,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.default
  ];

  system.stateVersion = "23.11";

  environment.etcBackupExtension = ".bak";



  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Set your time zone
  #time.timeZone = "Europe/Berlin";

  # Configure home-manager
  home-manager = {
    config = ./home.nix;
    backupFileExtension = "hm-bak";
    useGlobalPkgs = true;
  };

}
