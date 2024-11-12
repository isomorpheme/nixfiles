{ pkgs, me, flake-inputs, ... }:
{
  imports = [
    ./dev
    ./fish.nix
    ./git.nix
    ./utils.nix
    ./vim.nix
  ];

  home.username = me.username;
  home.homeDirectory = "/home/${me.username}";
  home.stateVersion = "22.05";

  nix.registry = {
    # Add a flake registry entry pointing to the nixpkgs pinned in `flake.lock`,
    # so that commands like `nix run` don't redownload the latest
    # nixpkgs-unstable every time, and so that it's in sync with the nixpkgs
    # used by home-manager.
    nixpkgs = {
      from = { id = "nixpkgs"; type = "indirect"; };
      flake = flake-inputs.nixpkgs;
    };
  };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "zed --wait";
  };

  home.packages = [
    pkgs.cachix
  ];

  programs.home-manager = {
    enable = true;
  };
}
