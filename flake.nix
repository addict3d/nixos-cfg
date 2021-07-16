{
  inputs = {
    home-manager.url = "github:nix-community/home-manager";
    nixpkgs = { url = "github:NixOS/nixpkgs/nixos-unstable"; };
    musnix = { url = "github:musnix/musnix"; };
  };
  outputs = inputs: rec {
    nixosConfigurations = {
      Quercusalba = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ## Other modules will also be here
          inputs.musnix.nixosModules.musnix
          ./configuration.nix ## Configuration file from regular /etc/nixos config
        ];
        specialArgs = { inherit inputs; }; ## Inherit inputs to configuration.nix so you can call inputs.inputname
       };
      };
  };
}
