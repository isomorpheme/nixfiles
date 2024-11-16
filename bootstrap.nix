{ writeShellApplication, home-manager, stow }:
writeShellApplication {
  name = "bootstrap";
  runtimeInputs = [ home-manager stow ];
  text = ''
    stow --verbose \
      --target "$HOME" \
      --stow "stow" \
      --no-folding

    home-manager switch
  '';
}
