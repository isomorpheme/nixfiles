#
# fisher package manager
#
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

#
# aliases & abbreviations
#

alias la "ls -a"

abbr --add g git

#
# environment variables
#

set -gx EDITOR "vim"
set -gx GIT_EDITOR $EDITOR
set -gx VISUAL "code --wait"

set -gx PATH "$HOME/.local/bin" $PATH

set -gx PATH "$HOME/.cargo/bin" $PATH

if type -q ruby
    set gem_user_dir (ruby -e 'print Gem.user_dir')
    set -gx PATH "$gem_user_dir/bin" $PATH
    set -gx GEM_HOME $gem_user_dir
end

if type -q yarn
    set -gx PATH (yarn global bin) $PATH
end
