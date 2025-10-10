{
  config,
  pkgs,
  inputs,
  ...
}:

let
  nixpkgs.overlays = [
    (self: super: {
      linuxPackages_6_12 = super.linuxPackages_6_12.extend (
        lpself: lpsuper: {
          it87 = lpsuper.it87.overrideAttrs (oldAttrs: {
            src = pkgs.fetchFromGitHub {
              owner = "frankcrawford";
              repo = "it87";
              #  Thu Mar 27, 2025
              rev = "4bff981a91bf9209b52e30ee24ca39df163a8bcd";
              sha256 = "sha256-hjNph67pUaeL4kw3cacSz/sAvWMcoN2R7puiHWmRObM=";
            };
          });
        }
      );
    })
  ];

  my-linuxPackages = pkgs.linuxPackages_6_12;
in
{
  boot = {
    kernelPackages = my-linuxPackages;
    kernelModules = [
      "it87"
#      "v4l2loopback"
    ];
    extraModulePackages = with config.boot.kernelPackages; [
      it87
#      v4l2loopback
    ];
    kernelParams = [ "acpi_enforce_resources=lax" ];
  };
}
