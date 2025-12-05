# Normally I have a mutable Zed install (both the executable itself and the config) but
# there is some related configuration that is helpful.
{
  programs.git = {
    ignores = [
      ".zed"
    ];
  };

  home.sessionVariables = {
    VISUAL = "zeditor --wait";
  };
}
