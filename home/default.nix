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

    # Make ~/.local act like an extension to /usr/local.
    # FUTURE: This will get unnecessary as I nixify more stuff.
    LIBRARY_PATH = "$HOME/.local/lib:$LIBRARY_PATH";
    LD_LIBRARY_PATH = "$HOME/.local/lib:$LD_LIBRARY_PATH";
  };

  home.sessionPath = [
    # TODO: Do I still need this?
    "$HOME/.local/bin"
  ];

  programs.home-manager = {
    enable = true;
  };
}
