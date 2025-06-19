{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];

      forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);

      nixpkgsFor =
        forAllSystems (system: import nixpkgs { inherit system; });

      ghcVersion = "ghc912";
    in
    {
      devShell = forAllSystems (system:
        let
          pkgs = nixpkgsFor.${system};
        in
        pkgs.mkShell {
          packages = [
            pkgs.haskell.compiler.${ghcVersion}
            pkgs.cabal-install
            pkgs.haskell.packages.${ghcVersion}.haskell-language-server
          ];
          nativeBuildInputs = [
            pkgs.zlib
          ];
        }
      );
    };
}
