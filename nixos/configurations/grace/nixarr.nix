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
      flood.enable = true;
      extraSettings = {
        "ratio_limit" = 2.0;
        "ratio_limit_enabled" = true;
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
