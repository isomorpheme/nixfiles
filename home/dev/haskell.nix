{ pkgs, ... }:
{
  imports = [
    # TODO: Can we auto-import everything under `modules/` somehow?
    ../../modules/programs/ghcup.nix
  ];

  iso.programs.ghcup = {
    enable = true;
  };

  # FUTURE: GHC 9.2 started looking in XDG_CONFIG_HOME, so put this there
  # instead... in the far future when I don't have to use older versions
  # anymore, hopefully.
  home.file.".ghc/ghci.conf" = {
    text = ''
      :set prompt "\ESC[1;35mλ> \ESC[m"
      :set prompt-cont "\ESC[1;35m > \ESC[m"
    '';
  };
}
