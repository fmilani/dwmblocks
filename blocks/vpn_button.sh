#!/bin/sh

is_connected() {
  [[ $(pgrep openfortivpn) ]] && echo 1
}

connect() {
  notify-send "Connecting to VPN"
  sudo openfortivpn -c ~/.local/share/openfortivpn/config
}

disconnect() {
  password=$(echo "Enter your password:" | dmenu -P -p "password")
  echo "$password" | sudo -S kill -15 $(pgrep openfortivpn) &> ~/disconnect.log 
  notify-send "Disconnecting to VPN"
}

toggle() {
  if [[ $(is_connected) ]]; then
    disconnect
  else
    connect
  fi
}

case $1 in
  1) toggle && sigdwmblocks 4;;
esac
