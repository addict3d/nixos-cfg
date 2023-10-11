{ config, lib, ... }:

{
  # add Kim user
  users.users.kim = {
    isNormalUser = true;
    createHome = lib.mkForce false;
  };
}
