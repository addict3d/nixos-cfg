{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    hplipWithPlugin
  ];
}

