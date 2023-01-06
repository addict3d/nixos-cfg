{ config, pkgs, ... }:

{
  sound.enable = true;

  hardware.pulseaudio.enable = true;


#  musnix = {
#    enable = true;
#
#    alsaSeq.enable = true;
#
#
    # (lspci | grep -i audio)
#    soundcardPciId = "00:1b.0";
#
#  };


  # following in https://nixos.wiki/wiki/JACK

  environment.systemPackages = with pkgs; [ libjack2 jack2 qjackctl
                                            pavucontrol libjack2 jack2 qjackctl jack2Full jack_capture ];
}

