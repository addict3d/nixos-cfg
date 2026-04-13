{ config, pkgs, inputs, ... }:

{
  imports = [ ./nick-work.nix ];

  home = {
    stateVersion = "22.05";

    file.".zshrc" = {
      text = ''
        export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status os_icon)
        export POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
        unsetopt share_history
        eval "$(direnv hook zsh)"
      '';
    };

    file.".config/nixpkgs/config.nix" = {
      text = ''
        { allowUnfree = true; }
      '';
    };
    packages = [ pkgs.direnv ];
  };

  programs.bash = {
    enable = true;
    enableVteIntegration = true;
    initExtra = ''
      # hook direnv
      eval "$(direnv hook bash)"

      # nix porcelain customizations
      function nsd() {
        case $# in
          1)
            nix derivation show "$1" | jq -C . | bat
            ;;
          2)
            nix derivation show "$1" | jq -C .\""$1"\"."$2" | bat
            ;;
          *)
            echo "nsd: don't know what to do with $@"
            ;;
        esac
      }
      export -f nsd

    '';
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

  programs.git = {
    enable = true;

    lfs.enable = true;

    settings = {
      user = {
        name = "Nick Bathum";
        email = "nickbathum@gmail.com";
      };

      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      
      # input markdown directly
      core.commentChar = ";";

      merge.conflictStyle = "zdiff3";
    };

    signing = {
      key = "04197E06F68C4DA2F45DC12E6F47A049DC3446FB";
      signByDefault = true;
    };

    difftastic = {
      enable = true;
      color = "always";
    };

    includes = [
      {
        condition = "gitdir:~/work/rjg/";
        contents = {
          user = {
            email = "nickbathum@gmail.com";
          };
        };
      }
    ];

    extraConfig = {
    };
  };

  programs.ssh = {
    enable = true;

    matchBlocks = {
      "bitbucket.org" = {
        identityFile = "~/.ssh/rsa_ncataria";
      };

      "github.com" = {
        identityFile = "~/.ssh/rsa_ncataria";
      };

      "gitlab.com" = {
        identityFile = "~/.ssh/rsa_ncataria";
      };
    };
  };

}
