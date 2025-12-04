#!/bin/bash

# yay -S fuse2 # fusermount

NUM=$(simple-mtpfs -l)
echo "$NUM" | dmenu -l 20 -p "Umount device:"
fusermount -u ~/myphone
notify-send "Device unmount"
