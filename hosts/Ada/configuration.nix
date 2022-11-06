{ pkgs, me, ... }:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

  nixpkgs.config.allowUnfree = true;

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    grub.extraEntries = ''
      menuentry "Ubuntu" {
        search --set=ubuntu --fs-uuid 8fa1bd10-5152-4b71-bb2f-4cff0929a5d9
        configfile "($ubuntu)/boot/grub/grub.cfg"
      }
    '';
  };

  swapDevices = [
    {
      device = "/var/swapfile";
      size = 8192;
    }
  ];

  users.users.${me.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
    packages = [
      pkgs.firefox
    ];
  };

  # FUTURE: Have this passed in by the flake.
  networking.hostName = "Ada";

  networking.networkmanager.enable = true;

  # FUTURE: Can this be set based on location?
  time.timeZone = "Europe/Amsterdam";

  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    layout = "us";
    xkbOptions = "eurosign:5";

    displayManager.gdm.enable = true;

    desktopManager.gnome = {
      enable = true;
      # Doing this here instead of home-manager because I think GNOME's default
      # setting for this ("finger") is Wrong.
      extraGSettingsOverrides = ''
        [org.gnome.desktop.peripherals.touchpad]
        click-method="default"
      '';
    };
  };

  programs.xwayland.enable = true;

  # FUTURE: Printing.
  # services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  programs.fish.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = [
    pkgs.git
    pkgs.vim
    pkgs.vscode
    pkgs.wget
  ];
}
