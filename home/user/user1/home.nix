{
  self,
  ...
}:

{ 

  imports = [ 

    # apps
    "${self}/home/module/app/broot"
    "${self}/home/module/app/btop"
    "${self}/home/module/app/fish"
    "${self}/home/module/app/lsd"
    "${self}/home/module/app/ripgrep"
    "${self}/home/module/app/skim"
    "${self}/home/module/app/yazi"
    "${self}/home/module/app/zellij"
    "${self}/home/module/app/zoxide"

    # "${self}/home/module/module/stylix"

    # per user
    ./variables.nix

    # other apps
    ./app.nix

  ];

}
