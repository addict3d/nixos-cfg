{ config, pkgs, ... }:

with pkgs;

{
  boot = {
    kernelPackages = linuxPackages_5_18;
    kernelModules = with linuxPackages_5_18; [ v4l2loopback ];
  };

 # musnix.kernel = {
 #   optimize = true;
 #   realtime = true;
 #   packages = pkgs.linuxPackages_latest_rt;
 # };
}
