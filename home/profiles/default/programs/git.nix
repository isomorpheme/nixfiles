{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "isomorpheme";
        email = "iso@morpheme.tech";
      };

      color.ui = true;
      column.ui = "auto";

      branch.sort = "committerdate";
      tag.sort = "version:refname";

      diff = {
        algorithm = "histogram";
        colorMoved = true;
        mnemonicPrefix = true;
        renames = true;
      };

      commit = {
        verbose = true;
      };

      merge = {
        conflictstyle = "zdiff3";
      };

      rebase = {
        autoSquash = true;
        autoStash = true;
        missingCommitsCheck = "warn";
      };

      rerere = {
        enabled = true;
        autoupdate = true;
      };

      fetch = {
        all = true;
        # This will make it choose "some reasonable default".
        parallel = 0;
        prune = true;
        pruneTags = true;
      };

      pull = {
        rebase = true;
      };

      push = {
        autoSetupRemote = true;
        followTags = true;
      };
    };

    lfs.enable = true;
  };

  programs.gh = {
    enable = true;
  };

  home.packages = [
    pkgs.git-absorb
    pkgs.git-branchless
  ];

  home.shellAliases = {
    git = "git-branchless wrap --";
  };

  programs.fish = {
    shellAbbrs =
      {
        g = "git";
      } // builtins.mapAttrs
        (_: expansion: { command = "git"; inherit expansion; })
        {
          a = "add";
          c = "commit";
          co = "checkout";
          ps = "push";
          pl = "pull";
          s = "status";

          brl = "branchless";
        };
  };
}
