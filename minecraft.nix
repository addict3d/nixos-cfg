{ config, pkgs, ... }:

  let
    simpleVoiceChatPort = 24454;
  in
{
  networking.firewall.allowedUDPPorts = [ simpleVoiceChatPort ];

  networking.firewall.allowedTCPPorts = [ 25565 ];

  services.minecraft-server = {
    enable = false;
    eula = true;
    openFirewall = true;
    jvmOpts = "-Xmx6G -Xms2G -XX:SoftMaxHeapSize=3G -XX:+UnlockExperimentalVMOptions -XX:+UseZGC -XX:-ZProactive";
  };
}

