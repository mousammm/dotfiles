#!/bin/bash


APP=$(echo "" | dmenu -p "Enter text:")
PGREP=$(pgrep "$APP")

kill -9 "$PGREP" 
notify-send "KILLED-IT: $PGREP"

