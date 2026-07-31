#!/usr/bin/env bash

# check if stow is installed
if ! command -v stow &> /dev/null; then
    echo "Error: GNU Stow is not installed. Please install it first." >&2
    exit 1
fi

DOT_DIR="$HOME/dotfiles"
FILES=(".zshrc" ".zprofile" ".tmux.conf" ".vimrc" ".gitconfig")

echo "Installing SetUp..."

# Link Files with verbose output
for f in "${FILES[@]}"; do
    echo "Linking $DOT_DIR/$f -> $HOME/$f"
    ln -sf "$DOT_DIR/$f" "$HOME/$f"
done

# Stow .config dirs
mkdir -p ~/.config
stow -d "$DOT_DIR" -t "$HOME/.config" .config

# list .config dir
echo "Stowed configurations:"
if [ -d "$DOT_DIR/.config" ]; then
    for item in "$DOT_DIR/.config"/*; do
        if [ -e "$item" ]; then
            basename "$item" | sed 's/^/  - /'
        fi
    done
fi

echo "done!"
