#!/bin/bash

HOST_NAME=$(cat /etc/hostname)
USER_NAME=$(whoami)

NET=$(nmcli -t -f STATE general)
VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}')
TEMP=$(sensors | grep ^Tctl | awk '{print $2}')
MEM=$(free -h | awk '/^Mem:/ {print $3"/"$2}' | sed 's/i//g')
DATE_TIME=$(date '+%b %d (%a) %I:%M%p')



echo "$HOST_NAME"@"$USER_NAME"
echo "network ($NET)"
echo "Volume ($VOL)"
echo "CPU $TEMP"
echo "MEM $MEM"
echo "$DATE_TIME"
