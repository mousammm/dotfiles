#!/bin/bash

# required wget tar mv ln
# remove fd from pkg manager 

set -e

FD_VERSION="10.4.2"
FD_FILE="fd-v${FD_VERSION}-x86_64-unknown-linux-gnu.tar.gz"
FD_DIR="fd-v${FD_VERSION}-x86_64-unknown-linux-gnu"
DOWNLOAD_URL="https://github.com/sharkdp/fd/releases/download/v${FD_VERSION}/${FD_FILE}"

# Download 
echo "Downloading FD ${FD_VERSION}..."
wget -q --show-progress "$DOWNLOAD_URL"

# Extract
echo "Extracting..."
tar xzf "$FD_FILE"

# Install
echo "Installing to /usr/local..."
sudo mv "$FD_DIR" /usr/local/lib/fd
sudo ln -sf /usr/local/lib/fd/fd /usr/local/bin/fd

# Cleanup
rm "$FD_FILE"

echo "FD ${FD_VERSION} installed successfully!"
echo ""
fd --version
