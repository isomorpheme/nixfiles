{ pkgs, ... }:
{
  home.packages = [
    pkgs.fd
    pkgs.ripgrep
    pkgs.yq
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "ansi";
    };
  };

  programs.eza = {
    enable = true;
    enableAliases = true;
  };

  programs.jq = {
    enable = true;
  };
}
