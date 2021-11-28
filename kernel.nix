{ config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_5_15;

 # musnix.kernel = {
 #   optimize = true;
 #   realtime = true;
 #   packages = pkgs.linuxPackages_latest_rt;
 # };
}
