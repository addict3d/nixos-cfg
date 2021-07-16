{ config, pkgs, ... }:

{
  nix = {
    autoOptimiseStore = true;
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
