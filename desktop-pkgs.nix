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

    gimp
    inkscape

    obs-studio

    openscad

    # calibre-web # fixme: lxml<4.8.0,>=3.8.0
    # calibre # fixme: /nix/store/lwwi79jflxl8yns80axg1jwcbqp3w99j-python3.9-apsw-3.37.0-r1.drv

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

