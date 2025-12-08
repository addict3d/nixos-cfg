{ config, pkgs, inputs, ... }:

{

  programs.steam = {
    enable = true;
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    "steam"
    "steam-unwrapped"
  ];
}

