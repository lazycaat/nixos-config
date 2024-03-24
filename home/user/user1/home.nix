{
  self,
  ...
}:

{ 

  imports = [ 

    # apps
    "${self}/home/module/app/zellij"
    "${self}/home/module/app/yazi"
    "${self}/home/module/app/fish"

    # "${self}/home/module/module/stylix"

    # per user
    ./variables.nix

  ];

}
