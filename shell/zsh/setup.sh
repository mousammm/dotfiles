#!/usr/bin/env bash

DIR="$HOME/dotfiles/shell/zsh"
FILES=( ".zprofile" ".zshrc" )

for f in "${FILES[@]}"; do
    echo "Linking $DIR/$f -> $HOME/$f"
    ln -sf "$DIR/$f" "$HOME/$f"
done
