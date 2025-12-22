#!/bin/bash

# sudo pacman -S swww 
# sudo pacman -S fzf

WALL_DIR="$HOME/Pictures/wallpapers/"
# WALL=$(ls "$WALL_DIR" | fzf --preview "chafa --size=40x20 {}")

if [ ! -d "$WALL_DIR" ]; then
    mkdir -p "$WALL_DIR"
    echo "$WALL_DIR created!"
fi

WALL=$(ls "$WALL_DIR" | fzf --reverse --height 10 --info=hidden)
if [[ -z "$WALL" ]]; then
    echo "No wallpaper selected"
    exit 1
fi

swww img "$WALL_DIR/$WALL" --transition-step 3 --transition-fps 100 --transition-type left
echo "Wall:~/Pictures/wallpapers/$WALL"
