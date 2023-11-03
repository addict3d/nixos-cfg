{ config, pkgs, inputs, ... }:

{
  systemd.packages = with pkgs; [
    psi-notify  # manually configure for now
  ];

  programs.corectrl.enable = true;

  environment.systemPackages = with pkgs; [
    maim
    vlc
    dia

    zotero

    gimp
    inkscape

    obs-studio

    openscad

    calibre # fixme: /nix/store/lwwi79jflxl8yns80axg1jwcbqp3w99j-python3.9-apsw-3.37.0-r1.drv

    freerdp

    inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.signal-desktop
    tigervnc

    claws-mail
    krdc

    google-chrome
    google-chrome-beta

    winbox
    xsel
    zoom-us
  ];
}

