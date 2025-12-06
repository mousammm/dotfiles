#!/bin/bash
if command -v sensors &> /dev/null; then
    temp=$(sensors | grep -E "(Tctl|Package id|Core)" | head -1 | awk '{print $2}' | tr -d '+°C')
    echo "${temp}°C"
elif [ -f /sys/class/thermal/thermal_zone0/temp ]; then
    temp=$(cat /sys/class/thermal/thermal_zone0/temp)
    echo "$((temp/1000))°C"
else
    echo "N/A"
fi
