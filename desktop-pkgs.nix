{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    maim

    freerdp

    tigervnc

    krdc

    google-chrome
    google-chrome-beta

    winbox
    zoom-us
  ];
}

