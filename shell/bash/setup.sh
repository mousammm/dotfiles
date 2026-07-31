#!/usr/bin/env bash

DIR="$HOME/dotfiles/shell/bash"
FILES=( ".bashrc" ".bash_profile" ".inputrc" )

for f in "${FILES[@]}"; do
    echo "Linking $DIR/$f -> $HOME/$f"
    ln -sf "$DIR/$f" "$HOME/$f"
done
