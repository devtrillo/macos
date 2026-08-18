{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nix-darwin,
      nixpkgs,
    }:
    let
      system = "aarch64-darwin";

      mkHost =
        hostname: modules:
        nix-darwin.lib.darwinSystem {
          inherit system;
          modules = modules ++ [
            {
              nixpkgs.hostPlatform = system;
              system.configurationRevision = self.rev or self.dirtyRev or null;
              system.stateVersion = 6;
            }
          ];
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#simple
      darwinConfigurations = {
        "lifelink" = mkHost "lifelink" [
          ./modules/common.nix
          ./modules/lifelink.nix
        ];
        "server" = mkHost "server" [
          ./modules/common.nix
          ./modules/server.nix
        ];
        "personal" = mkHost "personal" [
          ./modules/common.nix
          ./modules/personal.nix
        ];
      };
    };
}
