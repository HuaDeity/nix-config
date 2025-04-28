{
  description = "Starter Configuration for MacOS and Linux";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-command-not-found = {
      url = "github:homebrew/homebrew-command-not-found";
      flake = false;
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-private = {
      url = "git+ssh://git@github.com/huadeity/homebrew-private.git";
      flake = false;
    };
    homebrew-macism = {
      url = "github:laishulu/homebrew-homebrew";
      flake = false;
    };
    homebrew-createzap = {
      url = "github:nrlquaker/homebrew-createzap";
      flake = false;
    };
  };

  outputs =
    {
      self,
      darwin,
      nix-homebrew,
      homebrew-cask,
      homebrew-command-not-found,
      homebrew-core,
      homebrew-private,
      homebrew-macism,
      homebrew-createzap,
      home-manager,
      nixpkgs,
    }@inputs:
    let
      linuxSystems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      darwinSystems = [
        "aarch64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs (linuxSystems ++ darwinSystems) f;
      devShell =
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default =
            with pkgs;
            mkShell {
              nativeBuildInputs = with pkgs; [
                bashInteractive
                git
              ];
              shellHook = ''
                export EDITOR=vim
              '';
            };
        };
    in
    {
      devShells = forAllSystems devShell;

      darwinConfigurations = nixpkgs.lib.genAttrs darwinSystems (
        system:
        let
          user = "huadeity";
        in
        darwin.lib.darwinSystem {
          inherit system;
          specialArgs = inputs;
          modules = [
            home-manager.darwinModules.home-manager
            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                inherit user;
                # Install Homebrew under the default prefix
                enable = true;
                # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
                enableRosetta = false;
                taps = {
                  "homebrew/homebrew-cask" = homebrew-cask;
                  "homebrew/homebrew-command-not-found" = homebrew-command-not-found;
                  "homebrew/homebrew-core" = homebrew-core;
                  "huadeity/homebrew-private" = homebrew-private;
                  "laishulu/homebrew-macism" = homebrew-macism;
                  "nrlquaker/homebrew-createzap" = homebrew-createzap;
                };
                mutableTaps = false;
                autoMigrate = true;
              };
            }
            ./hosts/darwin
          ];
        }
      );

      homeConfigurations = nixpkgs.lib.genAttrs linuxSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = inputs;
          modules = [
            ./hosts/linux
          ];
        }
      );

    };
}
