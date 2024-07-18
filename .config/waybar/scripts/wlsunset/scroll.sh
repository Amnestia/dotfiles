#!/bin/bash

source ~/.config/waybar/scripts/wlsunset/curr.sh

if [ -z "CURR" ]
then
	CURR=3000
fi

lower_bound=2400
upper_bound=6000
step=0

if [ ! -z "$1" ]
then
	if [[ "$1" == "-step" ]] || [[ "$1" == "-s" ]]
	then
		step=$2
	fi
fi

CURR=$(($CURR+$step))
if [ $CURR -lt $lower_bound ]
then
	CURR=$lower_bound
fi
if [ $CURR -gt $upper_bound ]
then
	CURR=$upper_bound
fi

fmt=$(printf '{"text": "", "percentage":%s, "tooltip":"%s"}' "$CURR" "$CURR")
echo -e "CURR=$CURR\necho '$fmt' || jq --unbuffered --compact-output" > ~/.config/waybar/scripts/wlsunset/curr.sh

if pgrep -x "wlsunset" > /dev/null
then
	pkill wlsunset > /dev/null 2>&1
fi

wlsunset -t $CURR & #-T $(($CURR+1)) -S 09:00 -s 16:00

pkill -RTMIN+4 waybar
