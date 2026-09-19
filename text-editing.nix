{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nixfmt
    nixpkgs-review
    nix-du
    nix-tree
  ];
}
