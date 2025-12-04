#!/bin/bash

# dmenu/

# Get available partitions with size
mountable=$(lsblk -lp | lsblk -lp | grep -E "/dev/sd[a-z][0-9]+.*part" | awk '{print $1, "(" $4 ")"}')
[[ "$mountable" = "" ]] && exit 1

# choose the part u want to mount 
chosen_part=$(echo "$mountable" | dmenu -l 20 -i -p "Which part to mount?" | awk '{print $1}')
[[ "$chosen_part" = "" ]] && exit 1

# check for mount point 
dirs=$(find /mnt -type d -maxdepth 1 2>/dev/null)
mount_point=$(echo "$dirs" | dmenu -l 20 -i -p "Type mount point.")

# create a mount point if not exist 
if [[ ! -d "$mount_point" ]]; then
	mkdiryn=$(echo -e "Yes\nNo" | dmenu -i -p "$mount_point does not exist. Create it!")
	[[ "$mkdiryn" = Yes ]] && sudo mkdir -p "&mount_point"
fi

sudo mount $chosen_part $mount_point 
# sudo mount $chosen_part $mount_point && pgrep -x dunst && notify-send "$chosen_part mounted to $mount_point"
