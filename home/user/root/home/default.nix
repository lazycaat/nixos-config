{
  self,
  ...
}: let

  terminal = "${self}/home/module/app/terminal";

in { 

  imports = [ 

    # apps
    "${terminal}/btop"
    "${terminal}/fish"
    "${terminal}/helix"
    "${terminal}/lsd"
    "${terminal}/ripgrep"
    "${terminal}/skim"
    "${terminal}/yazi"
    "${terminal}/zoxide"

    # per user
    ./variables.nix

  ];

}
