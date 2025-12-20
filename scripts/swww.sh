#!/bin/bash

# sudo pacman -S swww 
# sudo pacman -S fzf

WALL_DIR="$HOME/Pictures/wallpapers/"
# WALL=$(ls "$WALL_DIR" | fzf --preview "chafa --size=40x20 {}")
WALL=$(ls "$WALL_DIR" | fzf --reverse --height 10 --info=hidden)
if [[ -z "$WALL" ]]; then
    echo "No wallpaper selected"
    exit 1
fi

echo "$WALL"
swww img "$WALL_DIR/$WALL" --transition-step 1 --transition-fps 100 --transition-type simple
