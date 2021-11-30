{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    htop
    zenith-nvidia

    fd
    file

    bc
    strace
    lynis
    lsof


    screen

    # yubikey-manager-qt
    # yubikey-personalization-gui
  ];
}

