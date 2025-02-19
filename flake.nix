{
  description = "Simple NixOS configuration (Stable 24.05 with Unstable Overrides)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgsUnstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, nixpkgsUnstable, home-manager, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        stablePkgs = import nixpkgs {
          inherit system;
          config = { allowUnfree = true; };
          overlays = [ (import ./overlay.nix { inherit nixpkgsUnstable system; }) ];
        };
      in {
        nixosConfigurations."x1f4r-nix" = stablePkgs.lib.nixosSystem {
          system = system;
          modules = [
            ./system/configuration.nix
            ./system/hardware-configuration.nix
            ./system/users.nix
            {
              imports = [ home-manager.nixosModules.home-manager ];
              home-manager.users.x1f4r = import ./home-manager/home.nix;
            }
          ];
        };

        homeConfigurations.x1f4r = home-manager.lib.homeManagerConfiguration {
          pkgs = stablePkgs;
          system = system;
          modules = [ ./home-manager/home.nix ];
        };

        devShells.default = stablePkgs.mkShell {
          buildInputs = with stablePkgs; [ git vim tmux htop neofetch ];
        };
      });
}
