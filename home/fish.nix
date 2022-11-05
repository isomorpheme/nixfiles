{ pkgs, ... }:
{
  programs.fish = {
    enable = true;

    shellAbbrs = {
      g = "git";
      hm = "home-manager";
      nr = "nixos-rebuild";
    };

    plugins = [
      {
        name = "done";
        src = pkgs.fetchFromGitHub {
          owner = "franciscolourenco";
          repo = "done";
          rev = "d6abb267bb3fb7e987a9352bc43dcdb67bac9f06";
          sha256 = "6oeyN9ngXWvps1c5QAUjlyPDQwRWAoxBiVTNmZ4sG8E=";
        };
      }
      # HACK: This plugin isn't really necessary anymore, because the latest Nix
      # installer script supports Fish now; but the script it installs is broken
      # on my system version of Fish, so this is the workaround for now.
      {
        name = "nix-env";
        src = pkgs.fetchFromGitHub {
          owner = "lilyball";
          repo = "nix-env.fish";
          rev = "7b65bd228429e852c8fdfa07601159130a818cfa";
          sha256 = "RG/0rfhgq6aEKNZ0XwIqOaZ6K5S4+/Y5EEMnIdtfPhk=";
        };
      }
    ];
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
}
