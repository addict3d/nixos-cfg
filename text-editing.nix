{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nixfmt
  ];
}
