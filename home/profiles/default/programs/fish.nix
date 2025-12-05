{ flake, config, ... }:
{
  programs.fish = {
    enable = true;

    shellAbbrs = {
      hm = "home-manager";
      nr = "nixos-rebuild";
      snr = "sudo nixos-rebuild";
    };

    plugins = [
      {
        name = "done";
        src = flake.inputs.fish-done;
      }
    ];

    # https://github.com/nix-community/home-manager/issues/8178
    interactiveShellInit = ''
      set -p fish_complete_path ${config.programs.fish.package}/share/fish/completions
    '';
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      gcloud.disabled = true;
    };
  };
}
