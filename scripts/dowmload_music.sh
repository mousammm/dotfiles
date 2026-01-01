#!/bin/bash

# yt-dlp fzf
packages=("yt-dlp" "fzf")

# Check each package
for pkg in "${packages[@]}"; do
    if ! pacman -Q "$pkg" &>/dev/null; then
        echo "Error: Package '$pkg' is not installed."
        
        # Ask for confirmation
        read -p "Do you want to install '$pkg' now? [y/N] " -n 1 -r
        echo  # Move to a new line
        
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            echo "Installing $pkg..."
            sudo pacman -S "$pkg"
            echo "$pkg has been installed."
        else
            echo "Skipping $pkg installation."
            echo "The script requires $pkg to continue."
            exit 1
        fi
    fi
done

echo "Required packages found..."

LOG=/tmp/log.txt
read -p "Enter Song name:" SONG

if [[ -z "$LOG" ]]; then
    echo "Exit!"
    exit 1
fi

echo "searching for $SONG!"

# Search for music
yt-dlp --get-url --get-title --flat-playlist "ytsearch5:$SONG" > "$LOG"

# get the link from fzf
LINK=$(awk 'NR%2==1' $LOG | fzf --reverse --height 10 --info=hidden | while read selected; do
  # Get ONLY THE FIRST occurrence line number
  line_num=$(awk -v sel="$selected" '$0==sel {print NR; exit}' $LOG)
  if [[ -n "$line_num" ]]; then
    # Get the next line (line_num + 1)
    sed -n "$((line_num + 1))p" $LOG
  fi
done)

# if we dont like the serch songs exit
if [[ -z "$LINK" ]]; then
    echo "Brodah eeeeuuu!"
    exit 1
fi

echo "Started to download $SONG"

MUSIC_DIR="$HOME/Music"

if [ ! -d "$MUSIC_DIR" ]; then
    mkdir -p "$MUSIC_DIR"
    echo "$MUSIC_DIR created!"
fi

# dwomload the music 
yt-dlp -x --audio-format mp3 --audio-quality 0 --restrict-filenames -o "$MUSIC_DIR/%(title)s.%(ext)s" "$LINK"

echo "$SONG downloaed on $MUSIC_DIR"
rm "$LOG"
