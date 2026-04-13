{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nix-output-monitor
    jq
    delta

    cowsay

    freemind
    graphviz

    nix-query-tree-viewer

    python3Packages.jsondiff

    silicon
  ];
}

