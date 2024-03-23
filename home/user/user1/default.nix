{
  inputs,
  ...
}:

{

  users.users = {
    user1 = {
      isNormalUser = true;
      hashedPassword = "$y$j9T$dS2xm9Zcp2qgsbkLFbuqf0$qdLowPhZVwCOyhhmiv4DOxfiGHGFNyEGho9aU9a69DC";
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    };
  };

  programs.fuse.userAllowOther = true;
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "user1" = import ./home.nix;
    };
  };

  fileSystems."/persist/home/user1".neededForBoot = true;
  environment.persistence."/persist/home/user1" = {
    hideMounts = true;
    users.user1 = {
      directories = [
        "Downloads"
        "Music"
        "Pictures"
        "Documents"
        "Videos"
      ];
    };
  };


}
