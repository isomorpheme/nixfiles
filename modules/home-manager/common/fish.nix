{ pkgs, ... }:
{
  programs.fish = {
    enable = true;

    shellInit = ''
      # If we're not running as the fish from $PATH, we want to switch to that.
      # (For example, because $PATH has a newer version.)
      if test (status fish-path) != (readlink -f (which fish))
          exec fish
      end
    '';

    shellAbbrs = {
      hm = "home-manager";
      nr = "nixos-rebuild";
    };

    plugins = [
      {
        name = "done";
        src = pkgs.fetchFromGitHub {
          owner = "franciscolourenco";
          repo = "done";
          rev = "1.17.0";
          sha256 = "H+PVoZZ0JdGPcQBib600dzaymlU6rPCSEi8VZXyi/Xc=";
        };
      }
    ];
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      gcloud.disabled = true;
    };
  };
}
