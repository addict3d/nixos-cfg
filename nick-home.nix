{ config, pkgs, ... }:

{
  home = {
    file.".zshrc" = {
      text = ''
        export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status os_icon)
        export POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
        unsetopt share_history
        eval "$(direnv hook zsh)"
      '';
    };

    file.".bashrc" = {
      text = ''
        eval "$(direnv hook bash)"
      '';
    };

    file.".config/nixpkgs/config.nix" = {
      text = ''
        { allowUnfree = true; }
      '';
    };
    packages = [ pkgs.direnv ];
  };

  programs.direnv = {
    enable = true;


    # stolen from evanjs:
    # https://github.com/evanjs/nixos_cfg/blob/master/config/new-modules/console.nix#L72
    stdlib = ''
      layout_poetry() {
        if [[ ! -f pyproject.toml ]]; then
          log_error 'No pyproject.toml found. Use `poetry new` or `poetry init` to create one first.'
          exit 2
        fi

        # create venv if it doesn't exist
        poetry run true

        export VIRTUAL_ENV=$(poetry env info --path)
        export POETRY_ACTIVE=1
        PATH_add "$VIRTUAL_ENV/bin"
      }
    '';
  };
}
