# See https://github.com/NobbZ/nixos-config/blob/overhaul/nixos/modules/flake.nix
{ config, pkgs, nixpkgs, nix, lib, ... }:

let
  base = "/etc/nixpkgs/channels";
  nixpkgsPath = "${base}/nixpkgs";
  #nixpkgs2111Path = "${base}/nixpkgs2111";
in
{
  options.nix.flakes.enable = lib.mkEnableOption "nix flakes";

  config = lib.mkIf config.nix.flakes.enable {
    nix = {
      #experimentalFeatures = "nix-command flakes";

      registry.nixpkgs.flake = nixpkgs;
      #registry.nixpkgs2111.flake = nixpkgs-2111;

      nixPath = [
        "nixpkgs=${nixpkgsPath}"
        #"nixpkgs2111=${nixpkgs2111Path}"
        "/nix/var/nix/profiles/per-user/root/channels"
      ];
    };

    systemd.tmpfiles.rules = [
      "L+ ${nixpkgsPath}     - - - - ${nixpkgs}"
      #"L+ ${nixpkgs2111Path} - - - - ${nixpkgs-2111}"
    ];
  };
}

