{
  inputs,
  ...
}:

{

  imports = [ 
    inputs.home-manager.nixosModules.home-manager 
  ];


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

  environment.persistence."/persist" = {
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
