{ config, pkgs, ... }:

{

  programs.ssh.settings = {
    "jp" = {
      HostName = "172.16.0.240";
    };

    "jt" = {
      HostName = "172.16.0.228";
    };
  };

}
