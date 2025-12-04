#!/bin/bash

# yay -S simple-mtfs

NUM=$(simple-mtpfs -l | awk '{print $1}' | sed 's/://g')

echo "$NUM" | dmenu -l 20 -p "Mount Device:"

simple-mtpfs --device "$NUM" ~/myphone

# fusermount -u ~/device
