{ self, nixpkgs-nixos, ... }:
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
