{ config, pkgs, ... }:

{
  services.udev.packages = [ pkgs.yubikey-personalization ];

  environment.systemPackages = with pkgs; [
    yubikey-manager-qt
    yubikey-personalization-gui
  ];
}

