{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # social: discord
    betterdiscordctl

    maim

    freerdp
    # social: slack
    google-chrome
    google-chrome-beta

    zoom-us
  ];
}

