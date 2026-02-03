{ pkgs, ... }:
{
  nixarr = {
    enable = true;

    mediaDir = "/data/media";
    stateDir = "/var/lib/nixarr";

    jellyfin = {
      enable = true;
    };

    transmission = {
      enable = true;
      # Transmission 4.0.6 has a race condition where it may spam trackers with a lot of
      # announce requests, leading to many trackers banning this version. Downgrading
      # solves the issue for now.
      #
      # TODO: Once nixpkgs has Transmission at 4.1, this can be removed.
      # See: https://github.com/NixOS/nixpkgs/pull/485318
      package = pkgs.transmission_4.overrideAttrs (_: finalAttrs: {
        version = "4.0.5";
        src = pkgs.fetchFromGitHub {
          owner = "transmission";
          repo = "transmission";
          rev = finalAttrs.version;
          hash = "sha256-KBXvBFgrJ3njIoXrxHbHHLsiocwfd7Eba/GNI8uZA38=";
          fetchSubmodules = true;
        };
      });
      flood.enable = true;
      extraSettings = {
        "ratio_limit" = 2.0;
        "ratio_limit_enabled" = true;
        "peer_port_random_on_start" = true;
      };
    };

    prowlarr = {
      enable = true;
    };

    sonarr = {
      enable = true;
    };

    radarr = {
      enable = true;
    };
  };

  services.bitmagnet = {
    enable = true;
  };
}
