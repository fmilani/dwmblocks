#!/bin/sh

case $1 in
  1) notify-send "This Month" "$(cal | sed "s/\<$(date +'%e' | cut -c2-)\>/<b><span color='red'>&<\/span><\/b>/")" ;;
esac
