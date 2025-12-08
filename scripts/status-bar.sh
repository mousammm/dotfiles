#!/bin/bash

while true; do

    # cpu_temp=$(sensors | grep Tctl | awk '{print $2}' | tr -d '+')

    # Get memory usage
    # mem=$(free -h | awk '/^Mem:/ {print $3 "/" $2}')
    
    # Get current date and time
    datetime=$(date '+%a %d %b | %I:%M:%p')
    
    # Update status bar
    xsetroot -name "$datetime"
    
    sleep 1
done
