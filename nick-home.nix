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

  manual.manpages.enable = false;

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
  };


  programs.difftastic = {
    enable = true;
    git.enable = true;
    options = {
      color = "always";
    };
  };

  # todo: try jujutsu
  # programs.difftastic.jujutsu.enable
  # https://github.com/nix-community/home-manager/blob/master/modules/programs/jujutsu.nix


  programs.ssh = {
    enable = true;

    enableDefaultConfig = false;

    settings = {
      "bitbucket.org" = {
        IdentityFile = "~/.ssh/rsa_ncataria";
      };

      "github.com" = {
        IdentityFile = "~/.ssh/rsa_ncataria";
      };

      "gitlab.com" = {
        IdentityFile = "~/.ssh/rsa_ncataria";
      };

      "*" = {
        ExitOnForwardFailure = true;

        ForwardAgent = false;
        AddKeysToAgent = "no";
        Compression = false;
        ServerAliveInterval = 0;
        ServerAliveCountMax = 3;
        HashKnownHosts = false;
        UserKnownHostsFile = "~/.ssh/known_hosts"; 

        ControlMaster = "auto";
        ControlPath = "~/.ssh/control/cm-%r-at-%h_%p";
        ControlPersist = "10m";
      };
    };
  };

}
