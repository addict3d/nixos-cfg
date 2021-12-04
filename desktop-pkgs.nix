{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    maim

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

