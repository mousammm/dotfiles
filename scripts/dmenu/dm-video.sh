#!/bin/bash

# mpv/dmenu 

VIDEOS_DIR="$HOME/videos"

if [ ! -d "$VIDEOS_DIR" ]; then
    mkdir -p "$VIDEOS_DIR"
    notify-send "$VIDEOS_DIR created!"
fi

select_video=$(ls "$VIDEOS_DIR" | dmenu -l 20 -p "Watch Video:")

# echo "$VIDEOS_DIR/$select_video"
mpv "$VIDEOS_DIR/$select_video" 2>/dev/null

