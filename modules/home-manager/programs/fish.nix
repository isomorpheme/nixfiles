{ flake, ... }:
{
  programs.fish = {
    enable = true;

    shellAbbrs = {
      hm = "home-manager";
      nr = "nixos-rebuild";
    };

    plugins = [
      {
        name = "done";
        src = flake.inputs.fish-done;
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
