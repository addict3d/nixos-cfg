{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bzip2                                                              
    gzip                                                               
    pxz                                                                
    xz                                                               
    unzip                                                              
    zip                                                                
  ];
}

