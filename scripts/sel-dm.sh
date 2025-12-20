#!/bin/bash

SH=$(ls $HOME/dotfiles/scripts/dmenu | fzf --reverse --height 10 --info=hidden)

[[ "$SH" == " " ]] && exit 1

eval "$HOME/dotfiles/scripts/dmenu/$SH"
