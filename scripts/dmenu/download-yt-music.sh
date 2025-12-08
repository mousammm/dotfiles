#!/bin/bash

# dmenu ffmpeg yt-dll xclip dunt 
# url=$(echo "" | dmenu -p "Enter your text:")

MUSIC_DIR="$HOME/Music"

if [ ! -d "$MUSIC_DIR" ]; then
    mkdir -p "$MUSIC_DIR"
    notify-send "$MUSIC_DIR created!"
fi

url=$(xclip -o -selection clipboard)

sel_url=$(echo "$url" | dmenu -l 20 -p "Select link:")
yt-dlp -x --audio-format mp3 --audio-quality 0 -o "$MUSIC_DIR/%(title)s.%(ext)s" "$sel_url"

#echo "$sel_url"
notify-send "DOWMLOAD MUSIC" "$MUSIC_DIR"
