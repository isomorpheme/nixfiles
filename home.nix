{ config, pkgs, ... }:
{
  home.username = "daan";
  home.homeDirectory = "/home/daan";
  home.stateVersion = "22.05";

  home.packages = [
    pkgs.fd
    pkgs.git-machete
    pkgs.git-revise
    pkgs.ripgrep
  ];

  home.sessionVariables = {
    EDITOR = "vim";
    VISUAL = "code --wait";

    # Make ~/.local act like an extension to /usr/local.
    # FUTURE: This will get unnecessary as I nixify more stuff.
    LIBRARY_PATH = "$HOME/.local/lib:$LIBRARY_PATH";
    LD_LIBRARY_PATH = "$HOME/.local/lib:$LD_LIBRARY_PATH";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    # HACK: This is only because the ghcup package is broken.
    "$HOME/.ghcup/bin"
  ];

  programs.home-manager = {
    enable = true;
  };

  # git #

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

      m = "machete";
      r = "revise";
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
    };

    lfs.enable = true;
  };

  programs.gh = {
    enable = true;
  };

  # fish #

  programs.fish = {
    enable = true;

    shellAbbrs = {
      g = "git";
      hm = "home-manager";
    };

    plugins = [{
      name = "done";
      src = pkgs.fetchFromGitHub {
        owner = "franciscolourenco";
        repo = "done";
        rev = "d6abb267bb3fb7e987a9352bc43dcdb67bac9f06";
        sha256 = "6oeyN9ngXWvps1c5QAUjlyPDQwRWAoxBiVTNmZ4sG8E=";
      };
    }];
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  # vim #

  programs.vim = {
    enable = true;

    plugins = [
      pkgs.vimPlugins.vim-sensible
      pkgs.vimPlugins.vim-airline
      pkgs.vimPlugins.vim-airline-themes
    ];

    extraConfig = ''
      let g:airline_theme='minimalist'
    '';
  };

  # bat #

  programs.bat = {
    enable = true;
    config = {
      theme = "ansi";
    };
  };

  # exa #

  programs.exa = {
    enable = true;
    enableAliases = true;
  };
}
