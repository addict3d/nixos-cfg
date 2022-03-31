{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jq
    delta

    freemind

    jetbrains.idea-community
    jetbrains.clion

    python39Packages.jsondiff

    silicon

    vscode
  ];
}

