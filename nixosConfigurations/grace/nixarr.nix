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
