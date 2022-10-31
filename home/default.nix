{ pkgs, ... }:
{
  imports = [
    ./fish.nix
    ./git.nix
    ./haskell.nix
    ./utils.nix
    ./vim.nix
  ];

  home.username = "daan";
  home.homeDirectory = "/home/daan";
  home.stateVersion = "22.05";

  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "code --wait";
  };

  programs.home-manager = {
    enable = true;
  };
}
