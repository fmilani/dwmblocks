#!/bin/sh

case $1 in
	1) tmux-launch update update-packages ;;
	3) notify-send "$(/usr/bin/pacman -Qu)" ;;
esac
