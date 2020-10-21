function fish_right_mode_prompt
  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    switch $fish_bind_mode
      case default
        set_color -o green
        echo [NOR]
      case insert
        set_color -o cyan
        echo [INS]
      case replace-one
        set_color -o red
        echo [REP]
      case visual
        set_color -o magenta
        echo [VIS]
    end
    set_color normal
  end
end
