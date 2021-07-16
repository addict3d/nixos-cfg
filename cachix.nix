{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cachix
  ];
}

