#!/usr/bin/env bash

DIR="$HOME/dotfiles/.config/test"
FILES=( ".bashrc" ".bash_profile" ".inputrc" )

echo "Bash SetUp..."

for f in "${FILES[@]}"; do
    echo "Linking $DIR/$f -> $HOME/$f"
    ln -sf "$DIR/$f" "$HOME/$f"
done
