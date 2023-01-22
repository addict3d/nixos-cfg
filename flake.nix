{
  description = "Yokan [desktop] NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-22.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    musnix.url = "github:musnix/musnix";
    musnix.inputs.nixpkgs.follows = "nixpkgs";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    neovim-nightly-overlay.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: 
let
        it87-overlay = self: super: {
          # derp. namespaced under linuxPackages
          linuxPackages = super.linuxPackages.extend (lpself: lpsuper: {
            it87 = super.linuxPackages.it87.overrideAttrs (old: {
              src = super.fetchFromGitHub {
                owner = "frankcrawford";
                repo = "it87";
                # Jan 4th, 2023, Updated to match naming convention used in-tree version
                rev = "3e5333ad0b85216a81f33692875f33456e8064c9";
                sha256 = "sha256-wVhs//iwZUUGRTk1DpV/SnA7NZ7cFyYbsUbtazlxb6Q=";
              };
            });
          });
        };
      in


  rec {
    # nixosModules = import ./nixos/modules;
    formatter.x86_64-linux = inputs.nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;

    nixosConfigurations = {
      Yokan = inputs.nixpkgs.lib.nixosSystem 
      
      {
        system = "x86_64-linux";
        modules = [
          ({ config, pkgs, ... }: { nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlay it87-overlay ]; })
          inputs.musnix.nixosModules.musnix
          ./configuration.nix ## Configuration file from regular /etc/nixos config

          # TODO: Clean it up!
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              backupFileExtension = "bak";
              useGlobalPkgs = true; # see
              #https://github.com/nix-community/home-manager/issues/1519
              #https://github.com/divnix/devos/issues/30
              useUserPackages = true;
              users.nick = import ./nick-home.nix;
            };
            imports = [
              ./home.nix
            ];
          }
        ];
        specialArgs = { inherit inputs; }; ## Inherit inputs to configuration.nix so you can call inputs.inputname
      };
    };
  };
}
