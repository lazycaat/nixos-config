{
  ...
}:

{
  # Read the changelog before changing this value
  home.stateVersion = "23.11";

  # insert home-manager config

  # attribute 'self' missing
  imports = [ 

    # apps
    ../../../../home/module/app/terminal/broot
    ../../../../home/module/app/terminal/btop
    ../../../../home/module/app/terminal/fish
    ../../../../home/module/app/terminal/helix
    ../../../../home/module/app/terminal/lsd
    ../../../../home/module/app/terminal/ripgrep
    ../../../../home/module/app/terminal/skim
    ../../../../home/module/app/terminal/yazi
    ../../../../home/module/app/terminal/zellij
    ../../../../home/module/app/terminal/zoxide

    # modules
    # "${module}/stylix"
    # ../../../../home/module/module/nix-index

    # per user
    ./variables.nix

    # other apps
    ./app.nix

  ];

}
