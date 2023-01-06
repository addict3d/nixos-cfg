source /etc/set-environment && nix repl --file $(echo $NIX_PATH | rg '^.*?repl=(/nix/store/[a-z0-9]{32}-source/repl.nix).*?$' -r '$1')
