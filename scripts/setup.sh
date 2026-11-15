#!/usr/bin/env bash

KHELL=bash
. $HOME/dotfiles/$KHELL/setup.sh

# check if stow is installed
if ! command -v stow &> /dev/null; then
    echo "Error: GNU Stow is not installed. Please install it first." >&2
    exit 1
fi

# add everything except shell(bash)
DOT_DIR="$HOME/dotfiles"
FILES=(".tmux.conf" ".vimrc" ".gitconfig" ".gdbinit")

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
