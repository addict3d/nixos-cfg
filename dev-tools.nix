{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jq
    delta

    freemind

    jetbrains.idea-community
    jetbrains.clion

    nix-query-tree-viewer

    python39Packages.jsondiff

    silicon

    vscode
  ];
}

