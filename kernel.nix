{ config, pkgs, ... }:

let
  my-linuxPackages = pkgs.linuxPackages_6_1;
#  my-it87 = my-linuxPackages.it87.overrideAttrs (old: {
#    src = pkgs.fetchFromGitHub {
#      owner = "frankcrawford";
#      repo = "it87";
#      # Jan 4th, 2023, Updated to match naming convention used in-tree version
#      rev = "3e5333ad0b85216a81f33692875f33456e8064c9";
#      sha256 = "sha256-wVhs//iwZUUGRTk1DpV/SnA7NZ7cFyYbsUbtazlxb6Q=";
#    };
#  });
in


{
  nixpkgs.overlays = [
    (self: super: {
      linuxPackages_6_1 = super.linuxPackages_6_1.extend (lpself: lpsuper: {
        it87 = super.linuxPackages_6_1.it87.overrideAttrs (oldAttrs: {
          src = pkgs.fetchFromGitHub {
            owner = "frankcrawford";
            repo = "it87";
            # Jan 4th, 2023, Updated to match naming convention used in-tree version
            rev = "74e5fba9a888a72b5d7cde04552f3bb4c51c318e";
            sha256 = "sha256-AmEKAC41IDfaEVn54jBYDZkIY7NkpWxUVdK7GdUG1Tk=";
          };
        });
      });
    })
  ];

#  nixpkgs.config.packageOverrides = pkgs: pkgs.lib.recursiveUpdate pkgs {
#    linuxKernel.kernels.linux_6_0 = pkgs.linuxKernel.kernels.linux_6_0.override {
#      extraConfig = ''
#        KGDB y
#      '';
#    };
#  };

  boot = {
    kernelPackages = my-linuxPackages;
    kernelModules = [ "it87" ];
    extraModulePackages = with config.boot.kernelPackages; [ it87 v4l2loopback ];
    kernelParams = [ "acpi_enforce_resources=lax" ];
  };

 # musnix.kernel = {
 #   optimize = true;
 #   realtime = true;
 #   packages = pkgs.linuxPackages_latest_rt;
 # };
}
