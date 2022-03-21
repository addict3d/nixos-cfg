{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jq
    delta

    jetbrains.idea-community
    jetbrains.clion

    python39Packages.jsondiff

    silicon

    vscode
  ];
}

