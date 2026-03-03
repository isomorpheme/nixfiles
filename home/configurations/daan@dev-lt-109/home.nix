{ profilesPath, pkgs, ... }:
{
  imports = [
    (profilesPath + /default)
  ];

  home.username = "daan";
  home.homeDirectory = "/home/daan";
  home.stateVersion = "22.05";

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.packages = [
    pkgs.pyrefly
  ];

  programs.git = {
    includes = [
      {
        condition = "gitdir:~/channable/";
        contents = {
          user.name = "Daan Rijks";
          user.email = "daan.rijks@channable.com";
        };
      }
    ];
  };
}
