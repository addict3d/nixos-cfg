{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    maim
    vlc
    dia


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

