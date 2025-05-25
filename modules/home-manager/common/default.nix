{ pkgs, flake, ... }:
{
  imports = [
    ./dev
    ./fish.nix
    ./git.nix
    ./utils.nix
    ./vim.nix
  ];

  nix.registry = {
    # Add a flake registry entry pointing to the nixpkgs pinned in `flake.lock`,
    # so that commands like `nix run` don't redownload the latest
    # nixpkgs-unstable every time, and so that it's in sync with the nixpkgs
    # used by home-manager.
    nixpkgs = {
      from = { id = "nixpkgs"; type = "indirect"; };
      flake = flake.inputs.nixpkgs;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "zed --wait";
  };

  home.packages = [
    # Dev-related, but helps with Nix stuff in general so it goes here.
    pkgs.cachix
    pkgs.nixd
    pkgs.nil

    pkgs.zed-editor

    # Fonts
    pkgs.jetbrains-mono
  ];

  fonts.fontconfig = {
    enable = true;
  };

  programs.home-manager = {
    enable = true;
  };
}
