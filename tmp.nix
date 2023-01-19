{ config, ... }:

{
  nixpkgs.config.permittedInsecurePackages = [
    "python3.10-poetry-1.2.2"
    "xrdp-0.9.9"
  ];
}
