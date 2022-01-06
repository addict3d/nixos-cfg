{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    slack
    # todo : emacs: https://github.com/yuya373/emacs-slack

    betterdiscordctl
    discord

    weechat

    element-desktop
    zulip
    ];
}

