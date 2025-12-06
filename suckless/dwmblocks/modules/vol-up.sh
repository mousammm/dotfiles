#!/bin/bash

# Volume control script with dwmblocks signal support

case "$1" in
    up)
        # Increase volume by 5%
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        ;;
    down)
        # Decrease volume by 5%
        pactl set-sink-volume @DEFAULT_SINK@ -5%
        ;;
    toggle)
        # Toggle mute/unmute
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        ;;
    *)
        echo "Usage: $0 {up|down|toggle}"
        echo "Examples:"
        echo "  $0 up      # Increase volume"
        echo "  $0 down    # Decrease volume"
        echo "  $0 toggle  # Toggle mute"
        exit 1
        ;;
esac

# Send signal 10 to dwmblocks to update the volume display
pkill -RTMIN+10 dwmblocks
