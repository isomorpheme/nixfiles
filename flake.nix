{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-nixos.url = "github:nixos/nixpkgs/nixos-25.11";
    nixarr.url = "github:rasmus-kirk/nixarr";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fish-done = {
      url = "github:franciscolourenco/done";
      flake = false;
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations =
        import ./nixos/configurations inputs;

      homeConfigurations =
        import ./home/configurations inputs;

      packages.${system} = {
        bootstrap = pkgs.callPackage ./bootstrap.nix { home-manager = home-manager.packages.${system}.default; };
      };

      templates = {
        haskell = {
          path = ./templates/haskell;
          description = "Haskell";
        };
      };

      formatter.${system} = pkgs.nixpkgs-fmt;
    };
}
