{ config, pkgs, ... }:

{
  services.minecraft-server = {
    enable = false;
    eula = true;
    openFirewall = true;
    jvmOpts = "-Xmx6G -Xms2G -XX:SoftMaxHeapSize=3G -XX:+UnlockExperimentalVMOptions -XX:+UseZGC -XX:-ZProactive";
  };
}

