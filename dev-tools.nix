{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jq
    delta

    freemind
    graphviz

    jetbrains.idea-ultimate
    jetbrains.clion
    jetbrains.webstorm
    jetbrains.datagrip

    nix-query-tree-viewer

    python39Packages.jsondiff

    silicon

    vscode
  ];
}

