#!/bin/sh

case $1 in
	1) ps -eo comm,rss --no-headers \
		| awk '{a[$1]+=$2} END {for (i in a) printf "%.2f GB - %s\n", a[i]/1024/1024, i}' \
		| sort -rn | head -n 10 | dmenu -p "pkill -15" -l 10 | awk -F ' - ' '{print $2}' \
		| xargs pkill ;;
	3) tmux-launch mem htop ;;
esac

