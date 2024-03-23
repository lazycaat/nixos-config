{
  inputs,
  pkgs,
  ...
}: let

  theme = "${pkgs.base16-schemes}/share/themes/catppuccin.yaml";
  wallpaper = pkgs.runCommand "image.png" {} ''
        COLOR=$(${pkgs.yq}/bin/yq -r .base00 ${theme})
        COLOR="#"$COLOR
        ${pkgs.imagemagick}/bin/magick convert -size 1920x1080 xc:$COLOR $out
  '';

in {

  imports = [
    inputs.stylix.homeManagerModules.stylix
  ];

  stylix = {
    image = wallpaper;
    base16Scheme = theme;
    # polarity = "dark";
    autoEnable = true;
  };


}
