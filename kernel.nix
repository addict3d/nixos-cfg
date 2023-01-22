{ config, pkgs, ... }:

let
  my-linuxPackages = pkgs.linuxPackages_6_0;
  my-it87 = my-linuxPackages.it87.overrideAttrs (old: {
    src = pkgs.fetchFromGitHub {
      owner = "frankcrawford";
      repo = "it87";
      # Jan 4th, 2023, Updated to match naming convention used in-tree version
      rev = "3e5333ad0b85216a81f33692875f33456e8064c9";
      sha256 = "sha256-wVhs//iwZUUGRTk1DpV/SnA7NZ7cFyYbsUbtazlxb6Q=";
    };
  });
in


{
  boot = {
    kernelPackages = my-linuxPackages;
    kernelModules = [ "it87" ];
    extraModulePackages = with config.boot.kernelPackages; [ my-it87 v4l2loopback ];
  };

 # musnix.kernel = {
 #   optimize = true;
 #   realtime = true;
 #   packages = pkgs.linuxPackages_latest_rt;
 # };
}
