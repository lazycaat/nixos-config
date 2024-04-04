{

  description = "Nixos config flake";
     
  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [
      "x86_64-linux"
      # "aarch64-linux"
      # "x86_64-darwin"
      # "aarch64-darwin"
      # "i686-linux"
    ];
    imports = [ ./system/machine ];
  };

  inputs = {

    # Branches
    master.url = "github:nixos/nixpkgs/master";
    stable.url = "github:nixos/nixpkgs/release-23.11";
    unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # Default branch
    nixpkgs.follows = "unstable";


    # Modules

    ## System

    ### Declarative disk partitioning and formatting using nix
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    ### Manage a user environment using Nix
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    ### Simplify Nix Flakes with the module system
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    ### System-wide colorscheming and typography for NixOS
    stylix.url = "github:danth/stylix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    ### Collection of image builders
    nixos-generators.url = "github:nix-community/nixos-generators";
    nixos-generators.inputs.nixpkgs.follows = "nixpkgs";

    ### Tool for ephemeral root storage
    impermanence.url = "github:nix-community/impermanence";

    ### A collection of NixOS modules covering hardware quirks.
    nixos-hardware.url = "github:nixos/nixos-hardware";

    ### Secure Boot for NixOS
    lanzaboote.url = "github:nix-community/lanzaboote";

    ## TOOLS

    ### Weekly updated nix-index database
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

  };

}
