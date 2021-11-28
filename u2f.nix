{ config, pkgs, ... }:

{
 services.pcscd.enable = true;
 # services.udev.packages = [ pkgs.yubikey-personalization ];
#
  #environment.systemPackages = with pkgs; [
  #  yubikey-manager-qt
  #  yubikey-personalization-gui
  #];
}

