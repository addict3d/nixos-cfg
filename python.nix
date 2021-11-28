{ config, pkgs, ... }:

{
  # Also, direnvrc
  environment.systemPackages = with pkgs; [
    poetry
    jetbrains.pycharm-community
  ];
}

