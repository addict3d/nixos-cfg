{ config, pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_6_0;
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
  };

 # musnix.kernel = {
 #   optimize = true;
 #   realtime = true;
 #   packages = pkgs.linuxPackages_latest_rt;
 # };
}
