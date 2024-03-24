{
  inputs,
  pkgs,
  ...
}: let

  theme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
  wallpaper = pkgs.runCommand "image.png" {} ''
        # COLOR=$(${pkgs.yq}/bin/yq -r .base00 ${theme})
        # COLOR="#"$COLOR
        # ${pkgs.imagemagick}/bin/magick convert -size 1x1 xc:$COLOR $out
        ${pkgs.imagemagick}/bin/magick convert -size 1x1 xc:black $out
  '';

in {

  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    image = wallpaper;
    base16Scheme = theme;
    # polarity = "dark";
    # autoEnable = false;
    # homeManagerIntegration.autoImport = false;
    # tragets = {
    #   gnome.enable = false;
    # };
  };

}
