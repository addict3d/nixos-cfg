{ config, pkgs, inputs, ... }:

let
  primaryJDK = pkgs.openjdk21;
  toolchains = [ primaryJDK pkgs.openjdk8 pkgs.openjdk11 pkgs.openjdk17 ];
in
{
  environment.systemPackages = with pkgs; [
    primaryJDK
    (pkgs.gradle.overrideAttrs (_: _: {
      postFixup = ''
        cat > $out/lib/gradle/gradle.properties <<EOF
        org.gradle.java.installations.paths=${pkgs.lib.concatStringsSep "," toolchains}
        EOF
        '';
    }))
  ];
}

