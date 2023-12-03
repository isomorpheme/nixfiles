{ pkgs, ... }:
{
  imports = [
    ./haskell.nix
  ];

  home.packages = [
    pkgs.rustup
    pkgs.elan
  ];
}
