{
  pkgs,
  config,
  ...
}:

{

  programs.nushell = {
    enable = true;
    package = pkgs.nushellFull;

    extraEnv = ''
$env.config = {
  show_banner: false,
  edit_mode: vi
}

$env.EDITOR = ${config.home.sessionVariables.EDITOR} 

register ${pkgs.nushellPlugins.query}/bin/nu_plugin_query
register ${pkgs.nushellPlugins.gstat}/bin/nu_plugin_gstat
register ${pkgs.nushellPlugins.net}/bin/nu_plugin_net
    '';

  };

}
