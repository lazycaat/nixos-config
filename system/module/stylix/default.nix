{
  inputs,
  pkgs,
  ...
}: let

  theme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
  wallpaper = pkgs.runCommand "image.png" {} ''
        COLOR=$(${pkgs.yq}/bin/yq -r .base00 ${theme})
        COLOR="#"$COLOR
        ${pkgs.imagemagick}/bin/magick convert -size 1x1 xc:$COLOR $out
  '';

in {

  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    image = wallpaper;
    base16Scheme = theme;
    # polarity = "dark";
    autoEnable = false;
  };

}
