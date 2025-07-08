{ self, nixpkgs-nixos, nixarr, ... }:
let
  inherit (nixpkgs-nixos) lib;
in
lib.concatMapAttrs
  (name: type:
  if type != "directory" then
    { }
  else
    {
      ${name} =
        lib.nixosSystem {
          modules = [
            nixarr.nixosModules.default
            {
              system.configurationRevision =
                self.rev or self.dirtyRev or self.lastModified or null;
            }
            ./${name}/configuration.nix
          ];
        };
    }
  )
  (builtins.readDir ./.)
