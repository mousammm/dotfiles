#!/bin/bash

# grim 
# slurp
# fzf
# wl-clipboard

SCRT_DIR="$HOME/Pictures/screenshots"

if [ ! -d "$SCRT_DIR" ]; then
    mkdir -p "$SCRT_DIR"
    echo "$SCRT_DIR created!"
fi

sudo pacman -S grim slurp --needed

screenshot=$(scrot $SCRT_DIR/%Y-%m-%d-%T-scrt.png)
echo "scrnt saved at $SCRT_DIR/"
# notify-send "SCREENSHOT SAVED" "$SCRT_DIR/"
