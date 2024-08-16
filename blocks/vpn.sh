#!/bin/sh

is_connected() {
  [[ $(pgrep openfortivpn) ]] && echo 1
}

show_status() {
  [[ $(is_connected) ]] && echo "🔒On" || echo "🔒--"
}


main() {
  local status=$(show_status)
  echo $status
}

main
