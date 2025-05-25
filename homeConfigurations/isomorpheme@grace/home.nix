{ pkgs, myModulesPath, ... }:
{
  imports = [
    (myModulesPath + "/common")
  ];

  home.username = "isomorpheme";
  home.homeDirectory = "/home/isomorpheme";
  home.stateVersion = "22.05";

  home.packages = [
    pkgs.telegram-desktop
    pkgs.spotify
    pkgs.discord
  ];
}
