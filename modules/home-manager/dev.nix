{ pkgs, ... }:
{
  home.packages = [
    pkgs.rustup
    pkgs.elan
  ];

  xdg.configFile."ghci.conf" = {
    target = "ghc/ghci.conf";
    text = ''
      :set prompt "\ESC[1;35mλ> \ESC[m"
      :set prompt-cont "\ESC[1;35m > \ESC[m"
    '';
  };
}
