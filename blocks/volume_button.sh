#!/bin/sh
case $1 in
	1) tmux-launch volume pulsemixer ;;
	2) wpctl set-mute @DEFAULT_SINK@ toggle ;;
	4) wpctl set-volume @DEFAULT_SINK@ 1%+ ;;
	5) wpctl set-volume @DEFAULT_SINK@ 1%- ;;
	3) notify-send "📢 Volume module" "\- Shows volume 🔊, 🔇 if muted.
- Middle click to mute.
- Scroll to change." ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

sigdwmblocks 2

# case "$1" in
#     1) pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
#     3) pactl set-sink-volume @DEFAULT_SINK@ 50% ;;
# esac
