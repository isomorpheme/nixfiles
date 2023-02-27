{ pkgs, ... }:
{
  home.packages = [
    pkgs.fd
    pkgs.ripgrep
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

  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  programs.jq = {
    enable = true;
  };
}
