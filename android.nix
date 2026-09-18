{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = [ pkgs.android-tools ];

  users.users.nick.extraGroups = [ "adbusers" "dialout" ];
}
