#!/bin/bash

# required wget tar mv ln
# remove rg from pkg manager 
sudo rm /usr/local/bin/rg               # binary
sudo rm /usr/local/share/man/man1/rg    # man
sudo rm -rf /usr/local/lib/rg           # src

set -e

RG_VERSION="15.1.0"
RG_FILE="ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl.tar.gz"
RG_DIR="ripgrep-${RG_VERSION}-x86_64-unknown-linux-musl"
DOWNLOAD_URL="https://github.com/BurntSushi/ripgrep/releases/download/${RG_VERSION}/${RG_FILE}"

# Download 
echo "Downloading ${RG_DIR} ${RG_VERSION}..."
wget -q --show-progress "$DOWNLOAD_URL"

# Extract
echo "Extracting..."
tar xzf "$RG_FILE"

# Install
echo "Installing to /usr/local..."
sudo mv "$RG_DIR" /usr/local/lib/rg
sudo ln -sf /usr/local/lib/rg/rg /usr/local/bin/rg

# man pages 
sudo mkdir -p /usr/local/share/man/man1
sudo ln -sf /usr/local/lib/rg/doc/rg.1 /usr/local/share/man/man1/rg.1

# Cleanup
rm "$RG_FILE"

echo "${RG_DIR} ${RG_VERSION} installed successfully!"
echo ""
rg --version
