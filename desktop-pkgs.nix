{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # social: discord
    betterdiscordctl

    # social: slack

    zoom-us
  ];
}

