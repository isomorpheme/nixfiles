{ pkgs, ... }:
{
  programs.vim = {
    enable = true;

    plugins = [
      pkgs.vimPlugins.vim-sensible
      pkgs.vimPlugins.vim-airline
      pkgs.vimPlugins.vim-airline-themes
    ];

    extraConfig = ''
      let g:airline_theme='minimalist'
    '';
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };
}
