{
  services.jellyfin = {
    enable = true;
  };

  networking.firewall = {
    allowedTCPPorts = [
      # HTTP
      8096
      # HTTPS
      8920
    ];

    allowedUDPPorts = [
      # Discovery
      7359
    ];
  };
}
