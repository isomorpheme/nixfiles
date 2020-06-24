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

if grep -q Microsoft /proc/version
    set -gx DISPLAY '127.0.0.1:0.0'
end

#
# prompt
#

if type -q starship
    starship init fish | source
else
    echo "Starship executable not found! Falling back to default prompt." > /dev/stderr
end

#
# syntax highlighting
#

# These are basically the same colours as the default, but instead use generic
# terminal colours of hardcoded RGB (which can look terrible when your terminal
# theme doesn't match - why is it even the default???).
set fish_color_autosuggestion brblack
set fish_color_command blue
set fish_color_comment brblack
set fish_color_end green
set fish_color_error red
set fish_color_match --background=brblue
set fish_color_normal normal
set fish_color_param cyan
set fish_color_quote yellow
set fish_color_redirection magenta
set fish_color_operator magenta
set fish_color_escape green
set fish_pager_color_completion normal
set fish_pager_color_description yellow
set fish_pager_color_prefix blue --underline --bold
set fish_pager_color_progress brwhite --background=blue
