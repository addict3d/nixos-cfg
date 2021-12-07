{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jq
    delta

    jetbrains.idea-community

    python39Packages.jsondiff

    silicon
  ];
}

