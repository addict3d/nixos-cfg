{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    asciinema
    asciinema-scenario

    byzanz

    entangle
    #gnome.cheese
    plasma5Packages.kamoso
    v4l-utils
    webcamoid
    wxcam
  ];
}

