#!/bin/bash

# sudo pacman -S ffmpeg

ffmpeg -f x11grab -s 1920x1080 -framerate 30 -i :0.0 -f alsa -i default ~/output.mp4
notify-send "REC. ENDED"
