{ profilesPath, ... }:
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

  programs.git = {
    includes = [
      {
        condition = "gitdir:~/channable/";
        contents = {
          user.email = "daan.rijks@channable.com";
        };
      }
    ];
  };
}
