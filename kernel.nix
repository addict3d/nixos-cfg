{ config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_5_12;

 # musnix.kernel = {
 #   optimize = true;
 #   realtime = true;
 #   packages = pkgs.linuxPackages_latest_rt;
 # };
}
