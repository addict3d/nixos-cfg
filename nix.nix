{ config, pkgs, ... }:

{
  nix = {
    settings.auto-optimise-store = true;
    package = pkgs.nixVersions.latest;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
