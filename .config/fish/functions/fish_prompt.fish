# name: Nim
# author: Guilhem "Nim" Saurel − https://github.com/nim65s/dotfiles/
# with modifications by John Levandowski

function fish_prompt
    # This prompt shows:
    # - green lines if the last return command is OK, red otherwise
    # - your user name, in red if root or yellow otherwise
    # - your hostname
    # - the current path (with prompt_pwd)

    set -l retc red
    test $status = 0; and set retc green

    set_color $retc
    echo -n '┬─'
    set_color -o green
    echo -n [

    set_color -b black

    if functions -q fish_is_root_user; and fish_is_root_user
        set_color -o red
    else
        set_color -o yellow
    end

    echo -n $USER
    set_color -o white
    echo -n @

    set_color -o blue
    echo -n (prompt_hostname)
    set_color -o white
    echo -n :(prompt_pwd -d 0)
    set_color --reset -o green
    echo -n ']'

    # New line
    echo

    set_color --reset
    set_color $retc
    echo -n '╰─>'
    set_color -o red
    echo -n '$ '
    set_color --reset
end

# The default mode prompt would be prefixed, which ruins our alignment.
function fish_mode_prompt
end
