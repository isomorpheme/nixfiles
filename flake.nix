{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.lega3yPackages.${system};
    in
    {
      nixosConfigurations.Ada = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [ ./hosts/Ada/configuration.nix ];
      };

      homeConfigurations.daan = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs-unstable.legacyPackages.${system};

        modules = [ ./home ];

        extraSpecialArgs = {
          flake-inputs = inputs;
        };
      };

      formatter.${system} = pkgs.nixpkgs-fmt;
    };
}
