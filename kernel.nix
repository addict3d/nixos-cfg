{ config, pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_6_0;
    kernelModules = [ "it87" ];
    extraModulePackages = with config.boot.kernelPackages; [ it87 v4l2loopback ];
  };

 # musnix.kernel = {
 #   optimize = true;
 #   realtime = true;
 #   packages = pkgs.linuxPackages_latest_rt;
 # };
}
