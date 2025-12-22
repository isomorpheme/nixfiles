{ profilesPath, ... }:
{
  imports = [
    (profilesPath + /default)
  ];

  home.username = "daan";
  home.homeDirectory = "/home/daan";
  home.stateVersion = "22.05";
}
