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

  home.sessionVariables = {
    VISUAL = "zed --wait";
  };
}
