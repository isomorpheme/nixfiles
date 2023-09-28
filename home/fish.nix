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
          rev = "1.17.0";
          sha256 = "H+PVoZZ0JdGPcQBib600dzaymlU6rPCSEi8VZXyi/Xc=";
        };
      }
    ];
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
}
