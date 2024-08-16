#!/bin/sh
case "$(cat "/sys/class/power_supply/BAT0/status" 2>&1)" in
  "Full") status="⚡" ;;
  "Discharging") status="🔋" ;;
  "Charging") status="🔌" ;;
  "Not charging") status="🛑" ;;
  "Unknown") status="♻️" ;;
  *) exit 1 ;;
esac
read -r capacity </sys/class/power_supply/BAT0/capacity
[ "$status" = "🔋" ] && [ "$capacity" -le 25 ] && warn="❗"
printf "%s%s%3d%%" "$status" "$warn" "$capacity"
