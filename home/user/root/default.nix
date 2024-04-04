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
  ];

  programs.fuse.userAllowOther = true;
  home-manager = {
    extraSpecialArgs = {inherit inputs self;};
    shell = pkgs.fish;
    users = {
      "user1" = import ./home;
    };
  };

  users.users = {
    root = {
      hashedPassword = "$y$j9T$dS2xm9Zcp2qgsbkLFbuqf0$qdLowPhZVwCOyhhmiv4DOxfiGHGFNyEGho9aU9a69DC";
    };
  };

  programs.fish.enable = true;

}
