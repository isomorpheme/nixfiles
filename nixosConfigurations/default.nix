{ nixpkgs }:
  let
    inherit (nixpkgs) lib;
  in
    lib.pipe
      (builtins.readDir ./.)
      [
        (lib.concatMapAttrs (name: type:
          if type != "directory" then
            {}
          else
            {
              ${name} =
                lib.nixosSystem {
                  modules = [ ./${name}/configuration.nix ];
                };
            }
        ))
      ]
