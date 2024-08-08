{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      me.username = "daan";
    in
    {
      nixosConfigurations.Ada = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [ ./hosts/Ada/configuration.nix ];

        specialArgs = { inherit me; };
      };

      homeConfigurations.daan = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs-unstable.legacyPackages.${system};

        modules = [ ./home ];

        extraSpecialArgs = {
          inherit me;
          flake-inputs = inputs;
        };
      };

      formatter.${system} = pkgs.nixpkgs-fmt;
    };
}
