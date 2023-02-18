{ config, pkgs, ... }:

{

  programs.ssh.matchBlocks = {
    "jp" = {
      hostname = "172.16.0.240";
    };

    "jt" = {
      hostname = "172.16.0.228";
    };

  };

}
