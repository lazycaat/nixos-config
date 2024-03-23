{
  inputs,
  ...
}:

{ 
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  home.stateVersion = "23.11"; # Please read the comment before changing.

  # home.persistence."/persist/home/user1" = {
  #   directories = [
  #     "Downloads"
  #     "Music"
  #     "Pictures"
  #     "Documents"
  #     "Videos"
  #   ];
  #   allowOther = true;
  # };

}
