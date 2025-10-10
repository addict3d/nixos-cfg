{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [ kdePackages.kcharselect ];

  fonts.packages = with pkgs; [
    nerd-fonts.dejavu-sans-mono
  ];
}
