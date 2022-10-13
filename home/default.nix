{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./fish.nix
    ./vim.nix
    ./utils.nix
  ];

  home.username = "daan";
  home.homeDirectory = "/home/daan";
  home.stateVersion = "22.05";

  home.packages = [
    pkgs.stack
  ];

  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "code --wait";

    # Make ~/.local act like an extension to /usr/local.
    # FUTURE: This will get unnecessary as I nixify more stuff.
    LIBRARY_PATH = "$HOME/.local/lib:$LIBRARY_PATH";
    LD_LIBRARY_PATH = "$HOME/.local/lib:$LD_LIBRARY_PATH";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    # HACK: This is only because the ghcup package is broken.
    "$HOME/.ghcup/bin"
  ];

  programs.home-manager = {
    enable = true;
  };
}
