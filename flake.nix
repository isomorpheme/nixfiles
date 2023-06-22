{
  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations.daan = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./home ];

        extraSpecialArgs = {
          flake-inputs = inputs;
        };
      };

      formatter.${system} = pkgs.nixpkgs-fmt;
    };
}
