# Programs which search/visualize/sort/find information
# keywords: filesearch, grep
{ config, pkgs, ... }:

{
# TODO : alphabetize lists?
  environment.systemPackages = with pkgs; [
    tree

    ripgrep
    vgrep # todo : try this one. too . https://github.com/vrothberg/vgrep
    fzf # todo : try this out! https://github.com/junegunn/fzf
  ];
}

