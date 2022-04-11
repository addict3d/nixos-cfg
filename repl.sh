source /etc/set-environment && nix repl $(echo $NIX_PATH | rg '^.*?repl=(/nix/store/[a-z0-9]{32}-source/repl.nix).*?$' -r '$1')
