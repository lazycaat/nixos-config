{
  description = "Nixos config flake";
     
  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [ "aarch64-darwin" "x86_64-linux" ];
    imports = [ ./system/machine ];
  };

  inputs = {

    # branches
    master.url = "github:nixos/nixpkgs/master";
    stable.url = "github:nixos/nixpkgs/release-23.11";
    unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # default branch
    nixpkgs.follows = "unstable";



    # modules
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    impermanence = {
      url = "github:nix-community/impermanence";
    };

  };


}
