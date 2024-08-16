#!/bin/sh

case $1 in
	1) "$TERMINAL" -e nmtui ;;
	3) notify-send "Connected to" "$(nmcli -t -f NAME c show --active | head -n 1)" ;;
esac

