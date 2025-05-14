{ config, pkgs, ... }:

{
  services.calibre-web = {
    enable = false;
    options = {
      calibreLibrary = "/mnt/gold/calibre";
      enableBookUploading = true;
    };
  };
}

