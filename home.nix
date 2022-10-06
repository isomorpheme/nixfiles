{ config, pkgs, ...}:

{
  home.username = "daan";
  home.homeDirectory = "/home/daan";
  home.stateVersion = "22.05";

  home.packages = [
    pkgs.git-machete
  ];

  programs.home-manager = {
    enable = true;
  };

  programs.git = {
    enable = true;

    userName = "Daan Rijks";
    userEmail = "daanrijks@pm.me";

    aliases = {
      a = "add";
      c = "commit";
      co = "checkout";
      sw = "switch";
      ps = "push";
      pl = "pull";
      s = "status";
    };

    extraConfig = {
      color.ui = true;

      diff = {
        algorithm = "histogram";
        colorMoved = true;
      };

      pull.rebase = true;

      merge.conflictstyle = "diff3";

      rerere.enabled = true;

      submodule.recurse = true;
    };

    lfs.enable = true;
  };

  programs.gh = {
    enable = true;
  };
}
