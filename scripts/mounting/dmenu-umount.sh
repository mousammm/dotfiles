#!/bin/bash

exclusionregex="\(/boot\|/home\|/\)$"
drives=$(lsblk -lp | grep "t /" | grep -v "$exclusionregex" | awk '{print $1, "(" $4 ")", "on", $7}')
[[ "$drives" = "" ]] && exit 1

chosen=$(echo "$drives" | dmenu -l 20 -i -p "Unmount which drives?" | awk '{print $1}')
[[ "$chosen" = "" ]] && exit 1

#sudo unmount $chosen && pgrep -x dunst && notify-sned "$chosen unmounted"
sudo umount $chosen && echo "$chosen unmounted"



