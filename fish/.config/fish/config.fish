#
# aliases & abbreviations
#

alias la "ls -a"

abbr --add g git

#
# environment variables
#

set -gx EDITOR "vim"
set -gx VISUAL "code --wait"

# make ~/.local act like an extension to /usr/local
set -gx PATH "$HOME/.local/bin" $PATH
set -gx LIBRARY_PATH "$HOME/.local/lib" $LIBRARY_PATH
set -gx LD_LIBRARY_PATH "$HOME/.local/lib" $LD_LIBRARY_PATH

set -gx PATH "$HOME/.cargo/bin" $PATH

if type -q ruby
    set gem_user_dir (ruby -e 'print Gem.user_dir')
    set -gx PATH "$gem_user_dir/bin" $PATH
    set -gx GEM_HOME $gem_user_dir
end

if type -q yarn
    set -gx PATH (yarn global bin) $PATH
end

if grep -q Microsoft /proc/version
    set -gx DISPLAY '127.0.0.1:0.0'
end

if set -q GHCUP_INSTALL_BASE_PREFIX[1]
    set GHCUP_INSTALL_BASE_PREFIX $HOME
    set -gx PATH $HOME/.cabal/bin $PATH /home/daan/.ghcup/bin # ghcup-env
end

#
# prompt
#

if type -q starship
    starship init fish | source
else
    echo "Starship executable not found! Falling back to default prompt." >&2
end

#
# syntax highlighting
#
