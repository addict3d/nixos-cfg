{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [


# compression                                                      
    bzip2                                                              
      gzip                                                               
      pxz                                                                
      lzma                                                               
      unzip                                                              
      zip                                                                

  ];
}

