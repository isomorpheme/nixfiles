{ pkgs, ... }:
{
  home.packages = [
    pkgs.fd
    pkgs.ripgrep
  ];

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
}
