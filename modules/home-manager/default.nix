{
  imports = [
    ./programs
    ./fonts.nix
    ./nix.nix
  ];

  programs.home-manager = {
    enable = true;
  };

  nixpkgs.config = {
    allowUnfree = true;
  };
}
