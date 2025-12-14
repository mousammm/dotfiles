#!/bin/bash


APP=$(echo "" | dmenu -p "Enter text:")
[[ "$APP" == "" ]] && exit 1

PGREP=$(pgrep "$APP")

kill -9 "$PGREP" 
notify-send "KILLED-IT: $PGREP"

