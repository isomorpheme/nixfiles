{
  nixarr = {
    enable = true;

    mediaDir = "/data/media";
    stateDir = "/var/lib/nixarr";

    jellyfin = {
      enable = true;
    };
  };
}
