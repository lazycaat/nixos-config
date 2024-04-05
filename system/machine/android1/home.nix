{
  config,
  lib,
  ...
}:

{
  # Read the changelog before changing this value
  home.stateVersion = lib.mkForce config.system.stateVersion;

  # insert home-manager config
}
