function fish_prompt --description 'Write out the prompt'
    set -l stat $status
    set -l color
    set -l suffix

    if [ $USER = 'root' ]
        set suffix '#'
    else
        set suffix '$'
    end

    if [ $stat -eq 0 ]
        set color green
    else
        set color red
    end

    set_color -o magenta
    if [ -f ~/.machine ]
        printf '%s%s%s ' '[' (cat .machine) ']'
    end
    set_color -o blue
    printf '%s' (prompt_pwd)
    set_color normal
    echo -n (__fish_git_prompt)
    set_color -o $color
    printf ' %s ' $suffix
    set_color normal
end
