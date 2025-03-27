{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    userName = "Daan Rijks";
    userEmail = "daanrijks@pm.me";

    aliases = {
      a = "add";
      c = "commit";
      co = "checkout";
      ps = "push";
      pl = "pull";
      s = "status";

      brl = "branchless";
    };

    includes = [{
      # TODO: Would be nice to pull this into the repository as well; but
      # ideally, I'd like a setup where I can put a `.gitconfig` somewhere and
      # all the repos "below" it will load that config.
      path = "~/code/_chordify/.gitconfig";
      condition = "gitdir:~/code/_chordify/";
    }];

    extraConfig = {
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
        updateRefs = true;
      };

      rerere = {
        enabled = true;
        autoupdate = true;
      };

      submodule.recurse = true;

      fetch = {
        all = true;
        # This will make it choose "some reasonable default".
        parallel = 0;
        prune = true;
        pruneTags = true;
        recurseSubmodules = "on-demand";
      };

      pull = {
        rebase = true;
      };

      push = {
        recurseSubmodules = "on-demand";
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
}
