{
  self,
  ...
}: let

  terminal = "${self}/home/module/app/terminal";

in { 

  imports = [ 

    # apps
    "${terminal}/broot"
    "${terminal}/btop"
    "${terminal}/fish"
    "${terminal}/helix"
    "${terminal}/lsd"
    "${terminal}/ripgrep"
    "${terminal}/skim"
    "${terminal}/yazi"
    "${terminal}/zellij"
    "${terminal}/zoxide"

    # "${self}/home/module/module/stylix"

    # per user
    ./variables.nix

    # other apps
    ./app.nix

  ];

}
