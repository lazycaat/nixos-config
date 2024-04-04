{
  pkgs,
  ...
}:

{

  home.packages = with pkgs; [
    du-dust
    cloc
  ];

}
