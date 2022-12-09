{ pkgs, flake-inputs, ... }:
{
  imports = [
    ./fish.nix
    ./git.nix
    ./haskell.nix
    ./rust.nix
    ./utils.nix
    ./vim.nix
  ];

  home.username = "daan";
  home.homeDirectory = "/home/daan";
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

  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "code --wait";
  };

  programs.home-manager = {
    enable = true;
  };
}
