#!/bin/bash

# scrot

SCRT_DIR="$HOME/Pictures/screenshots"

if [ ! -d "$SCRT_DIR" ]; then
    mkdir -p "$SCRT_DIR"
    notify-send "$SCRT_DIR created!"
fi

screenshot=$(scrot $SCRT_DIR/%Y-%m-%d-%T-screenshot.png)
# echo "scrnt saved at $SCRT_DIR/"
notify-send "SCREENSHOT SAVED" "$SCRT_DIR/"
