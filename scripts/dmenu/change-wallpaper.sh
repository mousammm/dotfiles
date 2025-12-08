#!/bin/bash

# /dmenu/feh

WALLPAPER_DIR="$HOME/Pictures/wallpapers"

if [ ! -d "$WALLPAPER_DIR" ]; then
    mkdir -p "$WALLPAPER_DIR"
    notify-send "$WALLPAPER_DIR created!"
fi

SELECTED=$(ls "$WALLPAPER_DIR" | dmenu -l 20 -p "Select Wallpaper:")

if [ -n "$SELECTED" ]; then
    # Set wallpaper immediately
    feh --bg-fill "$WALLPAPER_DIR/$SELECTED"
fi

# Set wallpaper if selected
if [ -n "$SELECTED" ]; then
    feh --bg-fill "$WALLPAPER_DIR/$SELECTED"
    # echo "✅ Wallpaper set to: $SELECTED"
    notify-send "Wallpaper changed" "$SELECTED"
fi
