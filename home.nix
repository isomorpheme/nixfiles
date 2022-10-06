{ config, pkgs, ...}:

{
  home.username = "daan";
  home.homeDirectory = "/home/daan";

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;
}
