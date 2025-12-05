# On NixOS, I use a Nix-packaged Zed (but still mutable config for Zed itself).
{ pkgs, ... }:
{
  home.packages = [
    pkgs.zed-editor
  ];

  home.shellAliases = {
    "zed" = "zeditor";
  };

  home.sessionVariables = {
    VISUAL = "zeditor --wait";
  };
}
