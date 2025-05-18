{ lib, config, pkgs, ... }:
let
  cfg = config.iso.programs.ghcup;
in
{
  options = {
    iso.programs.ghcup = {
      enable = lib.mkEnableOption "ghcup";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      # TODO: Avoid that awful relative path.
      # Or maybe don't `callPackage` here at all, add it in an overlay?
      (pkgs.callPackage ../../../packages/ghcup-bin.nix { })
    ];

    home.sessionPath = [
      "$HOME/.cabal/bin"
      "$HOME/.ghcup/bin"
    ];
  };
}
