{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    maim
    vlc
    dia


    obs-studio

    calibre-web
    calibre

    freerdp

    tigervnc

    claws-mail
    krdc

    google-chrome
    google-chrome-beta

    winbox
    zoom-us
  ];
}

