# TODO : DESCRIBE

# TODO : FORMAT NIXFMT

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

# disk utilities
    gptfdisk                                                           
    e2fsprogs                                                          
    fsmon                                                              
    parted                                                             

# hardware
    dmidecode                                                          
    lm_sensors                                                         
    pciutils                                                           
    usbutils                                                           
    hdparm                                                             
    ethtool
  ];
}

