{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    maim
    vlc
    dia

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

