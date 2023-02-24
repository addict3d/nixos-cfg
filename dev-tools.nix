{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nix-output-monitor
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

