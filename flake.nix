{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      me.username = "daan";
    in
    {
      homeConfigurations.daan = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./home ];

        extraSpecialArgs = {
          inherit me;
          flake-inputs = inputs;
        };
      };

      packages.${system} = {
        bootstrap = pkgs.callPackage ./bootstrap.nix { inherit home-manager; };
      };

      formatter.${system} = pkgs.nixpkgs-fmt;
    };
}
