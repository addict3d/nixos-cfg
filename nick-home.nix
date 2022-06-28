{ config, pkgs, ... }:

{
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
        version = "2022-06-14";
        src = pkgs.fetchFromGitHub {
          owner = "neoclide";
          repo = "coc.nvim";
          rev = "87e5dd692ec8ed7be25b15449fd0ab15a48bfb30";
          sha256 = "sha256-bsrCvgQqIA4jD62PIcLwYdcBM+YLLKLI/x2H5c/bR50=";
        };
        meta.homepage = "https://github.com/neoclide/coc.nvim/";
      };
      pluginConfig = ''
        " nav comp list with tab
        inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
        inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
      '';
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
}
