{
  self,
  ...
}: let

  terminal = "${self}/home/module/app/terminal";
  module = "${self}/home/module/module";

in { 

  imports = [ 

    # apps
    "${terminal}/broot"
    "${terminal}/btop"
    "${terminal}/fish"
    "${terminal}/nushell"
    "${terminal}/helix"
    "${terminal}/lsd"
    "${terminal}/ripgrep"
    "${terminal}/skim"
    "${terminal}/yazi"
    "${terminal}/zellij"
    "${terminal}/zoxide"

    # modules
    # "${module}/stylix"
    "${module}/nix-index"

    # per user
    ./variables.nix

    # other apps
    ./app.nix

  ];

}
