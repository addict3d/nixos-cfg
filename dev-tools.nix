{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jq
    delta

    python39Packages.jsondiff
  ];
}

