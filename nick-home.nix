{ config, pkgs, ... }:

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
            nix show-derivation "$1" | jq -C . | bat
            ;;
          2)
            nix show-derivation "$1" | jq -C .\""$1"\"."$2" | bat
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

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    viAlias = true;
    vimAlias = true;

    coc = {
      enable = true;
      # See https://github.com/nix-community/home-manager/issues/2966
      package = pkgs.vimUtils.buildVimPluginFrom2Nix {
        pname = "coc.nvim";
        version = "0.0.82"; # 2022-07-31
        src = pkgs.fetchFromGitHub {
          owner = "neoclide";
          repo = "coc.nvim";
          rev = "1d3c525e2d6af0c07ed19fa7a5016ffc6a9e8421";
          sha256 = "sha256-TIkx/Sp9jnRd+3jokab91S5Mb3JV8yyz3wy7+UAd0A0=";
        };
        meta.homepage = "https://github.com/neoclide/coc.nvim/";
      };
      pluginConfig = ''
        function! s:check_back_space() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~ '\s'
        endfunction

        " Insert <tab> when previous text is space, refresh completion if not.
        inoremap <silent><expr> <TAB>
              \ coc#pum#visible() ? coc#pum#next(1):
              \ <SID>check_back_space() ? "\<Tab>" :
              \ coc#refresh()
        inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
      '';
      settings = {
        "java.trace.server"= "verbose";
        "java.configuration.runtimes" = with pkgs; [
          { name = "JDK8";
          path = "${openjdk8}/lib/openjdk";
          }
          { name = "JDK11";
            path = "${openjdk11}/lib/openjdk";
          }
          { name = "JDK17";
          path = "${openjdk17}/lib/openjdk";
          default = true;
          }
        ];
      };
    };

    withNodeJs = true; # tmp https://github.com/nix-community/home-manager/pull/3048

    plugins = with pkgs.vimPlugins; [
      coc-java
      coc-json
#     coc-rls
      jsonc-vim
      (nvim-treesitter.withPlugins (plugins: pkgs.tree-sitter.allGrammars))
      vim-plugin-AnsiEsc
      vim-nix
    ];
  };

  programs.git = {
    enable = true;

    userName = "Nick Bathum";
    userEmail = "nickbathum@gmail.com";

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
      init.defaultBranch = "main";
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
