{ self, nixpkgs, home-manager, ... }:
let
  inherit (nixpkgs) lib;
in
lib.concatMapAttrs
  (name: type:
  if type != "directory" then
    { }
  else
    {
      ${name} =
        home-manager.lib.homeManagerConfiguration {
          # The actual system we pass here doesn't really matter,
          # because it can be changed from within the configuration
          # later. See:
          # https://github.com/nix-community/home-manager/issues/4571
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [
            ../modules/home-manager
            ./${name}/home.nix
          ];
          extraSpecialArgs = {
            myModulesPath = ../modules/home-manager;
            flake = self;
          };
        };
    }
  )
  (builtins.readDir ./.)
