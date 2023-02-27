{ stdenv, fetchurl, autoPatchelfHook }:
stdenv.mkDerivation (final: {
  system = "x86_64-linux";
  version = "0.1.19.0";
  pname = "ghcup-bin";

  src = fetchurl {
    url = "https://downloads.haskell.org/~ghcup/${final.version}/${final.system}-ghcup-${final.version}";
    sha256 = "M+5qdY7gbjtSC+F2kF5hkuMfX6LirNxSWxvqd8o2ihI=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  # There's nothing to unpack, we're getting the binary directly
  unpackPhase = ''
    true
  '';

  installPhase = ''
    mkdir --verbose --parents $out/bin
    cp --verbose --archive $src $out/bin/ghcup
    chmod +x $out/bin/ghcup
  '';
})
