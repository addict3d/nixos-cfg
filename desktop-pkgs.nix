{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # social: discord
    betterdiscordctl

    # social: slack
    google-chrome
    google-chrome-beta

    zoom-us
  ];
}

