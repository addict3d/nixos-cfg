{ config, pkgs, ... }:

{
  nix = {
    settings.auto-optimise-store = true;
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
