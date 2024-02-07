{ config, pkgs, inputs, ... }:

let
  primaryJDK = pkgs.openjdk17;
  jdk21 = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.openjdk21;
  toolchains = [ primaryJDK pkgs.openjdk8 pkgs.openjdk11 jdk21 ];
in
{
  environment.systemPackages = with pkgs; [
    primaryJDK
    (pkgs.gradle_7.overrideAttrs (_: old: {
      fixupPhase = old.fixupPhase + ''
        cat > $out/lib/gradle/gradle.properties <<EOF
        org.gradle.java.installations.paths=${pkgs.lib.concatStringsSep "," toolchains}
        EOF
        '';
    }))
  ];
}

