function fish_prompt
    set fish_prompt_pwd_dir_length 3

    set -l input_char '¶'
    set -l pwd (prompt_pwd)
    set -l user $USER
    set -l host (hostname)

    set_color blue
    echo -n $user
    set_color normal

    echo -n " at "

    set_color magenta
    echo -n $host
    set_color normal

    echo -n " in "

    set_color green
    echo -n $pwd
    set_color normal

    echo

    echo -n "$input_char "
end

function fish_right_prompt
    if test $status -ne 0
        set_color white --background red
        printf " \uf06a " # fa-exclamation-circle
        set_color normal
    end
end
