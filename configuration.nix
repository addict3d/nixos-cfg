# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [
# {template to fill this in automatically on changes }

./archival.nix
./avahi.nix
./cachix.nix
./console.nix
./desktop-pkgs.nix
./dev-tools.nix
./hardware-configuration.nix
./hw-and-disk-util.nix
./kernel.nix
./nix.nix
./printer.nix
./python.nix
./rdp.nix
./search-files.nix
./social.nix
./sound.nix
./sysadmin-tools.nix
./text-editing.nix
./u2f.nix
          ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Yokan"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  #
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Detroit";

  nixpkgs.overlays = [ (import ./weechat.nix) ];

  # todo: how to incorporate modules?
  #nix.flakes.enable = true;

  nix.nixPath = let path = toString ./.; in
    [
      "repl=${path}/repl.nix"
      "nixpkgs=${inputs.nixpkgs}"
      "/nix/var/nix/profiles/per-user/root/channels"
    ];

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp7s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  #services.xserver.videoDrivers = [ "mode-setting" ];
  services.xserver.useGlamor = true;
  

  # Configure keymap in X11
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users.mutableUsers = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nick = {
    isNormalUser = true;
    extraGroups = [ "audio" "wheel" ]; # Enable ‘sudo’ for the user.
    hashedPassword = "$6$7/k2tBTCG$RcUdZo8GNe6u69fQX7bk9CglHkQWzZgT3ChfQiMVYI3agJLHbg8uR4qLlX1PrJr61SA4wweRtXctSyItD4ITP/";
    uid = 1000;
    description = "Nick FooBar";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    gitFull
    git-extras
    pass
    wget
    firefox
    bat
    kitty
    nm-tray
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

}

