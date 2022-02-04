{ config, pkgs, ... }:

{
  systemd.packages = with pkgs; [
    psi-notify  # manually configure for now
  ];
    
  environment.systemPackages = with pkgs; [
    gwe
    nvfancontrol
    nvtop

    maim
    vlc
    dia

    zotero

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

