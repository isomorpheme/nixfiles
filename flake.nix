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
      me.username = "isomorpheme";
    in
    {
      nixosConfigurations =
        import ./nixosConfigurations { nixpkgs = nixpkgs-nixos; };

      homeConfigurations.isomorpheme = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./home ];

        extraSpecialArgs = {
          inherit me;
          flake-inputs = inputs;
        };
      };

      packages.${system} = {
        bootstrap = pkgs.callPackage ./bootstrap.nix { home-manager = home-manager.packages.${system}.default; };
      };

      formatter.${system} = pkgs.nixpkgs-fmt;
    };
}
