#!/bin/bash

# mpv dmenu 

MUSIC_DIR=$HOME/Music/

MUSIC=$(ls "$MUSIC_DIR")
PLAY=$(echo "$MUSIC" | dmenu -l 20 -p "Play mugic:")
[[ "$PLAY" == "" ]] && exit 1

notify-send "PLAYING MUSIC" "$PLAY"
mpv "$MUSIC_DIR/$PLAY" 
