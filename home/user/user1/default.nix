{
  pkgs,
  inputs,
  self,
  ...
}:

{

  imports = [ 
    inputs.home-manager.nixosModules.home-manager 

    "${self}/home/module/module/home-manager"
    ./impermanence.nix

  ];

  programs.fuse.userAllowOther = true;
  home-manager = {
    extraSpecialArgs = {inherit inputs self;};
    users = {
      "user1" = import ./home.nix;
    };
  };

  users.users = {
    user1 = {
      isNormalUser = true;
      shell = pkgs.fish;
      hashedPassword = "$y$j9T$dS2xm9Zcp2qgsbkLFbuqf0$qdLowPhZVwCOyhhmiv4DOxfiGHGFNyEGho9aU9a69DC";
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    };
  };

  programs.fish.enable = true;

}
