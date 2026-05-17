#!/usr/bin/env bash

DOT_DIR="$HOME/dotfiles"
BAK_DIR="$HOME/.cache/dotfiles.bak"
FILES=(".bashrc" ".bash_profile" ".inputrc" ".tmux.conf" ".vimrc" )
FOLDERS=("kitty" "hypr" "nvim" "yazi" )

if [ "$1" == "R" ]; then
    echo "Uninstalling..."
    # Remove symlinks
    for f in "${FILES[@]}"; do rm -f "$HOME/$f"; done
    stow -d "$DOT_DIR" -t "$HOME/.config" -D .config 2>/dev/null

    # Restore backups
    if [ -d "$BAK_DIR" ]; then
        mv "$BAK_DIR"/.* "$HOME/" 2>/dev/null
        mv "$BAK_DIR"/* "$HOME/.config/" 2>/dev/null
        rm -rf "$BAK_DIR"
    fi

    echo "done!"
else
    echo "Installing..."
    mkdir -p "$BAK_DIR"

    # Backup and Link Files
    for f in "${FILES[@]}"; do
        [ -e "$HOME/$f" ] && [ ! -L "$HOME/$f" ] && mv "$HOME/$f" "$BAK_DIR/"
        ln -sf "$DOT_DIR/$f" "$HOME/$f"
    done

    # Backup and Stow Configs
    mkdir -p ~/.config
    for d in "${FOLDERS[@]}"; do
        [ -d "$HOME/.config/$d" ] && [ ! -L "$HOME/.config/$d" ] && mv "$HOME/.config/$d" "$BAK_DIR/"
    done
    stow -d "$DOT_DIR" -t "$HOME/.config" .config

    echo "done!"
fi

# stow -d ~/dotfiles/ -t ~/.config/ .config/ # stow
# stow -d ~/dotfiles/ -t ~/.config/ -D .config/ # unstow
