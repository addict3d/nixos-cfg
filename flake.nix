{
  description = "Yokan [desktop] NixOS Configuration";

  inputs = {
    home-manager.url = "github:nix-community/home-manager";
    nixpkgs = { url = "github:NixOS/nixpkgs/nixos-unstable"; };
    musnix = { url = "github:musnix/musnix"; };
  };

  outputs = inputs: rec {
    nixosConfigurations = {
      Yokan = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          inputs.musnix.nixosModules.musnix
          ./configuration.nix ## Configuration file from regular /etc/nixos config
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
