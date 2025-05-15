{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, homebrew-core
    , homebrew-cask, }:
    let
      system = "aarch64-darwin";

      mkHost = hostname: modules:
        nix-darwin.lib.darwinSystem {
          inherit system;
          modules = modules ++ [
            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                enable = true;
                enableRosetta = true;
                user = "trillo";
                autoMigrate = true;
              };
            }
            {
              nixpkgs.hostPlatform = system;
              system.configurationRevision = self.rev or self.dirtyRev or null;
              system.stateVersion = 6;
            }
          ];
        };
    in {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#simple
      darwinConfigurations = {
        "work" = mkHost "work" [ ./modules/common.nix ./modules/work.nix ];
      };
    };
}
