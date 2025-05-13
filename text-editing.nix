{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nixfmt-rfc-style
    nixpkgs-review
    nix-du
    nix-tree
  ];
}
