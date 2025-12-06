#!/bin/bash

while true; do

    # Get network connection
    net=$(nmcli -t -f STATE general)

    # Get volume %
    vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}')

    cpu_temp=$(sensors | grep Tctl | awk '{print $2}' | tr -d '+')

    # Get memory usage
    mem=$(free -h | awk '/^Mem:/ {print $3 "/" $2}')
    
    # Get current date and time
    datetime=$(date '+%a %d %b | %I:%M %p')

    # Update status bar
    xsetroot -name "$net | $vol | $cpu_temp | $mem | $datetime"
    
    sleep 1
done
