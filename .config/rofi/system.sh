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

  local -Ar icons=(
    ['Logout']='system-log-out'
    ['Suspend']='system-suspend'
    ['Hibernate']='system-hibernate'
    ['Restart']='system-reboot'
    ['Shutdown']='system-shutdown'
    ['Lock']='system-lock-screen'
  )

  if [[ $# -ne 0 ]]; then
    coproc ( ${menu[$1]} > /dev/null 2>&1 )
    exec 1>&-
    exit 1
  else
    for item in "${!icons[@]}"; do
      echo -en "${item}\0icon\x1f${icons[${item}]}\n"
    done
    exit 0
  fi
}

main $@
