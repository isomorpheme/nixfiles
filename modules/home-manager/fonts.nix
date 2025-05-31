{ pkgs, ... }:
{
    home.packages = [
      # Fonts
      pkgs.jetbrains-mono
    ];

    fonts.fontconfig = {
      enable = true;
    };
}
