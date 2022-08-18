{ config, pkgs, ... }:

let
  myhplip = pkgs.hplip.override {
    withPlugin = true;
    withStaticPPDInstall = true;
  };
in
{
  environment.systemPackages = [ myhplip ];

  services.printing = {
    enable = true;
    drivers = [ myhplip ];
  };
}

