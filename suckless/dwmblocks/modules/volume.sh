#!/bin/bash
if command -v pactl &> /dev/null; then
    pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}'
elif command -v amixer &> /dev/null; then
    amixer get Master | awk -F'[][]' '/%/ {print $2; exit}'
else
    echo "N/A"
fi
