{ config, pkgs, ... }:

{
  sound.enable = true;

#  hardware.pulseaudio.enable = true;

  musnix.enable = true;

    # (lspci | grep -i audio)
  musnix.soundcardPciId = "00:1b.0";
}

