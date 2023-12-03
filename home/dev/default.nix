{ pkgs, ... }:
{
  imports = [
    ./haskell.nix
  ];

  home.packages = [
    pkgs.rustup
  ];
}
