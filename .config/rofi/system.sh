#!/usr/bin/env bash
set -euo pipefail

function main() {
  local -Ar menu=(
    ['Logout']='i3-msg exit'
    ['Suspend']='systemctl suspend'
    ['Hibernate']='systemctl hibernate'
    ['Restart']='systemctl reboot'
    ['Shutdown']='systemctl poweroff'
    ['Lock']='loginctl lock-session'
  )

  local -r IFS=$'\n'

  [[ $# -ne 0 ]] && eval "${menu[$1]}" || echo "${!menu[*]}"
}

main $@
