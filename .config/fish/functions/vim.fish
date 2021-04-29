function vim
  for i in $argv
    set args "$args \"$i\""
  end
  eval $EDITOR $args
end
