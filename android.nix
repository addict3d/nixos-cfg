{ config, pkgs, inputs, ... }:

{
  programs.adb.enable = true;

  users.users.nick.extraGroups = [ "adbusers" "dialout" ];
}
