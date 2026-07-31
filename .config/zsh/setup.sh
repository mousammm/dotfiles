#!/usr/bin/env bash

DIR="$HOME/dotfiles/.config/zsh"
FILES=( ".zprofile" ".zshrc" )

echo "ZSH SetUp..."

for f in "${FILES[@]}"; do
    echo "Linking $DIR/$f -> $HOME/$f"
    ln -sf "$DIR/$f" "$HOME/$f"
done
