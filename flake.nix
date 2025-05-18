{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-nixos.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, nixpkgs-nixos, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations =
        import ./nixosConfigurations { nixpkgs = nixpkgs-nixos; };

      homeConfigurations =
        import ./homeConfigurations inputs;

      packages.${system} = {
        bootstrap = pkgs.callPackage ./bootstrap.nix { home-manager = home-manager.packages.${system}.default; };
      };

      formatter.${system} = pkgs.nixpkgs-fmt;
    };
}
