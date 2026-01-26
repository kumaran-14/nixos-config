{
  description = "kums multi host macos and linux nixos config";

  inputs = {
    # Where we get most of our software. Giant mono repo with recipes
    # called derivations that say how to build software.
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # Controls system level software and settings including fonts
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    # Manages configs links things into your home directory
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # declarative homebrew management
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs = {
    self,
    nix-darwin,
    nixpkgs,
    home-manager,
    nix-homebrew,
    ...
  } @ inputs: let
    primaryUser = "kums";
  in {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#zeus
    darwinConfigurations."zeus" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./modules/darwin
      ];
      specialArgs = {inherit inputs self primaryUser;};
    };
  };
}
