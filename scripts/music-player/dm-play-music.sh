#!/bin/bash

# mpv dmenu 

MUSIC_DIR=$HOME/Music/

MUSIC=$(ls "$MUSIC_DIR")
PLAY=$(echo "$MUSIC" | dmenu -l 20 -p "Play mugic:")

mpv "$MUSIC_DIR/$PLAY" 2>/dev/null
