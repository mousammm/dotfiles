#!/bin/bash

SH=$(ls $HOME/dotfiles/scripts/dmenu | dmenu -i -l 20 -p "All scripts:")

[[ "$SH" == " " ]] && exit 1

eval "$HOME/dotfiles/scripts/dmenu/$SH"
