#!/usr/bin/env bash

DOT_DIR="$HOME/dotfiles"
BAK_DIR="$HOME/.cache/dotfiles.bak"

if [[ "$1" == "R" ]]; then 
    echo "Restoring dotfiles..."

    rm -f ~/.bashrc ~/.inputrc ~/.zshrc ~/.tmux.conf

    [ -f "$BAK_DIR/.bashrc" ] && mv "$BAK_DIR/.bashrc" ~/
    [ -f "$BAK_DIR/.inputrc" ] && mv "$BAK_DIR/.inputrc" ~/
    [ -f "$BAK_DIR/.zshrc" ] && mv "$BAK_DIR/.zshrc" ~/
    [ -f "$BAK_DIR/.tmux.conf" ] && mv "$BAK_DIR/.tmux.conf" ~/

    rm -rf "$BAK_DIR"
    echo "done!"
else
    echo "Installing dots..."

    mkdir -p "$BAK_DIR"
    for file in .bashrc .inputrc .zshrc .tmux.conf; do
        [ -f "$HOME/$file" ] && [ ! -L "$HOME/$file" ] && mv "$HOME/$file" "$BAK_DIR/"
    done

    ln -sf "$DOT_DIR/.bashrc" ~/.bashrc
    ln -sf "$DOT_DIR/.inputrc" ~/.inputrc
    ln -sf "$DOT_DIR/.zshrc" ~/.zshrc
    ln -sf "$DOT_DIR/.tmux.conf" ~/.tmux.conf

    echo "done!"
fi

# .config/
#     clangd/
#     hypr/
#     kitty/
#     nvim/
#     yazi/
