#
# aliases & abbreviations
#

alias la "ls -a"

abbr --add g git

#
# Environment variables
#

set -gx EDITOR "vim"
set -gx GIT_EDITOR $EDITOR
set -gx VISUAL "code"

set -gx PATH "$HOME/.local/bin" $PATH
set -gx PATH "$HOME/.cargo/bin" $PATH
