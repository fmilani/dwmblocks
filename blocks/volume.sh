#!/bin/sh

# Prints the current volume or 🔇 if muted.

vol="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"

# If muted, print 🔇 and exit.
[ "$vol" != "${vol%\[MUTED\]}" ] && echo 🔇 && exit

vol="${vol#Volume: }"

get_soundcore_active_profile() {
	profile=$(pactl list cards | awk -v RS="" -v device="soundcore Liberty 4" '
    $0 ~ device {
        match($0, /Active Profile: ([^\n]*)/, arr)
        if (arr[1] != "")
            print arr[1]
    }
		')
	case "$profile" in
		"a2dp-sink-sbc_xq") echo "🎵" ;;
		"headset-head-unit") echo "📞" ;;
		*) echo "🔈" ;;
	esac
}

split() {
	# For ommiting the . without calling and external program.
	IFS=$2
	set -- $1
	printf '%s' "$@"
}

vol="$(printf "%.0f" "$(split "$vol" ".")")"

profile=$(get_soundcore_active_profile)
echo "$profile $vol" | awk '{printf "%s%3d%", $1, $2}'
