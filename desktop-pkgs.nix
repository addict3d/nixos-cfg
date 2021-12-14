{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    maim
    vlc
    dia

    # This should be a service?
    psi-notify  # manually configure for now

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

