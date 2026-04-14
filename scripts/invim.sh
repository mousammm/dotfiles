#!/bin/bash

# required wget tar mv ln
# remove nvim from pkg manager 

sudo rm /usr/local/bin/nvim                 # binary
sudo rm /usr/local/share/man/man1/nvim.1    # man
sudo rm -rf /usr/local/lib/nvim             # src

set -e

NVIM_VERSION="0.12.1"
NVIM_FILE="nvim-linux-x86_64.tar.gz"
NVIM_DIR="nvim-linux-x86_64"
DOWNLOAD_URL="https://github.com/neovim/neovim/releases/download/v${NVIM_VERSION}/${NVIM_FILE}"

# Download 
echo "Downloading ${NVIM_DIR} ${NVIM_VERSION}..."
wget -q --show-progress "$DOWNLOAD_URL"

# Extract
echo "Extracting..."
tar xzf "$NVIM_FILE"

# Install
echo "Installing to /usr/local..."
sudo mv "$NVIM_DIR" /usr/local/lib/nvim
sudo ln -sf /usr/local/lib/nvim/bin/nvim /usr/local/bin/nvim

# man pages 
sudo mkdir -p /usr/local/share/man/man1
sudo ln -sf /usr/local/lib/nvim/share/man/man1/nvim.1 /usr/local/share/man/man1/nvim.1

# Cleanup
rm "$NVIM_FILE"

echo "${NVIM_DIR} ${NVIM_VERSION} installed successfully!"
echo ""
nvim --version
