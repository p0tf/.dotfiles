function fish_right_prompt
  set -l err $status
  if test $err -ne 0
    set_color --bold red
    echo "$err "
    set_color normal
end
  fish_right_mode_prompt
end
