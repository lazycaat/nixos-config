{
  pkgs,
  inputs,
  ...
}:

{

  system.stateVersion = "23.05";

  nix = {
    settings = {
      sandbox = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };
    gc = {
      dates = "weekly";
      automatic = true;
      persistent = true;
    };
    registry = {
      nixpkgs.flake = inputs.nixpkgs;
    };
  };
  
  system.activationScripts.diff = {
    supportsDryActivation = true;
    text = ''
      ${pkgs.nvd}/bin/nvd --nix-bin-dir=${pkgs.nix}/bin diff \
           /run/current-system "$systemConfig"
    '';
  };

}
