#!/bin/bash

SH=$(find $HOME/dotfiles/scripts/ -type f -iname "*.sh")

SEL_SH=$(echo "$SH" | dmenu -i -l 20 -p "All scripts:")
[[ "$SEL_SH" == " " ]] && exit 1

echo "$SEL_SH"
eval "$SEL_SH"
