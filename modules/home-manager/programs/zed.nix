{ pkgs, ... }:
{
  home.packages = [
    pkgs.zed-editor
  ];

  home.shellAliases = {
    "zed" = "zeditor";
  };

  programs.git = {
    ignores = [
      ".zed"
    ];
  };

  home.sessionVariables = {
    VISUAL = "zeditor --wait";
  };
}
