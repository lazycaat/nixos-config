{
  pkgs,
  ...
}:

{

  services.ananicy = {
    package = pkgs.ananicy-cpp;
    enable = true;
  };
  
}
