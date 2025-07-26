#!/bin/sh

case $1 in
	1) ps -eo rss,args --no-headers \
  | awk -v maxlen=20 '{
    rss = $1
    $1 = ""
    sub(/^ /, "", $0)
    split($0, a, " ")
    cmd = a[1]
    n = split(cmd, parts, "/")
    short = parts[n]

    script = a[2]
    group = short " " script

    mem[group] += rss

    if (!(group in example)) {
      preview = $0
      if (length(preview) > maxlen) {
        preview = substr(preview, 1, maxlen) "..."
      }
      example[group] = preview
    }
  }
  END {
    for (i in mem) printf "%.2f GB - %s (%s)\n", mem[i]/1024/1024, i, example[i]
  }' \
  | sort -rn | head -n 20 \
		| dmenu -p "pkill -15" -l 20 | awk -F ' - ' '{print $2}' \
		| xargs pkill ;;
	3) tmux-launch mem htop ;;
esac

