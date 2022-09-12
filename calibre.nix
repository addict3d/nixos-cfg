{ config, pkgs, ... }:

{
  services.calibre-web = {
    enable = true;
    options = {
      calibreLibrary = "/mnt/gold/calibre";
      enableBookUploading = true;
    };
  };
}

