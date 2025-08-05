{ config, pkgs, ... }:

{
  services.hardware.openrgb = {
    enable = true;
    #package = ...
    #server.port = ...
  };
}
