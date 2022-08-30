{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    asciinema
    asciinema-scenario

    byzanz

    entangle
    #gnome.cheese
    plasma5Packages.kamoso
    webcamoid
    wxcam
  ];
}

