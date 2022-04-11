{
  description = "Yokan [desktop] NixOS Configuration";

  inputs.home-manager.url = "github:nix-community/home-manager";
  inputs.nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.musnix.url = "github:musnix/musnix";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";

  outputs = inputs: rec {

    # nixosModules = import ./nixos/modules;

    nixosConfigurations = {
      Yokan = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          inputs.musnix.nixosModules.musnix
          ./configuration.nix ## Configuration file from regular /etc/nixos config

          # TODO: Clean it up!
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              backupFileExtension = "bak";
              useGlobalPkgs = true;  # see
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
