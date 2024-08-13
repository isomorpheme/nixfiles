{ pkgs, ... }:
{
  home.packages = [
    pkgs.fd
    pkgs.httpie
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
  };

  programs.jq = {
    enable = true;
  };
}
