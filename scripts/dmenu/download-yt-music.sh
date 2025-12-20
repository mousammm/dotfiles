#!/bin/bash

# dmenu ffmpeg yt-dll xclip
# url=$(echo "" | dmenu -p "Enter your text:")

MUSIC_DIR="$HOME/Music"

if [ ! -d "$MUSIC_DIR" ]; then
    mkdir -p "$MUSIC_DIR"
    echo "$MUSIC_DIR created!"
fi

url=$(xclip -o -selection clipboard)

sel_url=$(echo "$url" | fzf)
yt-dlp -x --audio-format mp3 --audio-quality 0 -o "$MUSIC_DIR/%(title)s.%(ext)s" "$sel_url"

#echo "$sel_url"
echo "DOWMLOAD MUSIC $MUSIC_DIR"
