#!/bin/bash

source ~/.config/waybar/scripts/wlsunset/curr.sh

icon=""
if [ -z "CURR" ]
then
	CURR=3000
fi

if pgrep -x "wlsunset" > /dev/null
then
	icon=""
	pkill wlsunset > /dev/null 2>&1
else
	icon=""
	wlsunset -t $CURR &#-T $(($CURR+1)) -S 09:00 -s 16:00
fi

fmt=$(printf '{"text": "%s", "percentage":%s, "tooltip":"%s"}' "$icon" "$CURR" "$CURR")
echo -e "CURR=$CURR\necho '$fmt' || jq --unbuffered --compact-output" > ~/.config/waybar/scripts/wlsunset/curr.sh

pkill -RTMIN+4 waybar
