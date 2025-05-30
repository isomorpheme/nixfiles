{ pkgs, ... }:
{
  home.packages = [
    pkgs.zed-editor
  ];

  programs.git = {
    ignores = [
      ".zed"
    ];
  };
}
