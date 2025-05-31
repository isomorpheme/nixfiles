{ pkgs, ... }:
{
  imports = [
    ./fish.nix
    ./git.nix
    ./vim.nix
    ./zed.nix
  ];

  home.packages = [
    pkgs.fd
    pkgs.httpie
    pkgs.ripgrep
    pkgs.yq

    pkgs.rustup
    pkgs.elan
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "ansi";
    };
  };

  programs.eza = {
    enable = true;
  };

  programs.jq = {
    enable = true;
  };

  xdg.configFile."ghci.conf" = {
    target = "ghc/ghci.conf";
    text = ''
      :set prompt "\ESC[1;35mλ> \ESC[m"
      :set prompt-cont "\ESC[1;35m > \ESC[m"
    '';
  };
}
