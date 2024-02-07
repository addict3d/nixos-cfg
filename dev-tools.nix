{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nix-output-monitor
    jq
    delta

    cowsay

    freemind
    graphviz

    #pkgs.openjdk17
    #(pkgs.gradle_7.override { java = openjdk17; javaToolchains = [ openjdk8 openjdk11 openjdk17 ]; })
    jetbrains.idea-community
    jetbrains.clion
    jetbrains.webstorm
    jetbrains.datagrip

    nix-query-tree-viewer

    python39Packages.jsondiff

    silicon

    vscode
  ];
}

