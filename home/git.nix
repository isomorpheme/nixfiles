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

      diff = {
        algorithm = "histogram";
        colorMoved = true;
      };

      pull.rebase = true;

      merge.conflictstyle = "diff3";

      rerere.enabled = true;

      submodule.recurse = true;

      fetch = {
        recurseSubmodules = "on-demand";
        # This will make it choose "some reasonable default".
        parallel = 0;
      };

      push = {
        recurseSubmodules = "on-demand";
        autoSetupRemote = true;
      };

      rebase = {
        missingCommitsCheck = "warn";
        autoStash = true;
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
