#
# aliases & abbreviations
#

alias la "ls -a"

abbr --add p (detect_package_manager)

abbr --add g git

#
# environment variables
#

set -gx EDITOR "vim"
set -gx GIT_EDITOR $EDITOR
set -gx VISUAL "code --wait"

set -gx PATH "$HOME/.local/bin" $PATH
set -gx PATH "$HOME/.cargo/bin" $PATH
