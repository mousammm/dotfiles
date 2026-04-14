#!/bin/bash

# required wget tar mv ln
# remove nvim from pkg manager 

set -e

NVIM_VERSION="0.12.1"
NVIM_FILE="nvim-linux-x86_64.tar.gz"
NVIM_DIR="nvim-linux-x86_64"
DOWNLOAD_URL="https://github.com/neovim/neovim/releases/download/v${NVIM_VERSION}/${NVIM_FILE}"

# Download 
echo "Downloading Neovim ${NVIM_VERSION}..."
wget -q --show-progress "$DOWNLOAD_URL"

# Extract
echo "Extracting..."
tar xzf "$NVIM_FILE"

# Install
echo "Installing to /usr/local..."
sudo mv "$NVIM_DIR" /usr/local/lib/nvim
sudo ln -sf /usr/local/lib/nvim/bin/nvim /usr/local/bin/nvim

# Cleanup
rm "$NVIM_FILE"

echo "✓ Neovim ${NVIM_VERSION} installed successfully!"
echo ""
nvim --version | head -n1
