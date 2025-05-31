{ pkgs, flake, ... }:
{
  home.packages = [
    pkgs.cachix
    pkgs.nixd
    pkgs.nil
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

}
