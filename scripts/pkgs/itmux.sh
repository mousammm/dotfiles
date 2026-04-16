#!/bin/bash

# wget tar mv ln

set -e
NAME="tmux"
LOC="/usr/local"

sudo rm -f ${LOC}/bin/${NAME}               # binary
sudo rm -f ${LOC}/share/man/man1/${NAME}.1  # man pages

VER="3.6"
FILE="tmux-${VER}a"
DOWNLOAD_URL="https://github.com/tmux/tmux/releases/download/${VER}a/${FILE}.tar.gz"

# Download 
echo "Downloading ${NAME} ${VER}..."
wget -q --show-progress "$DOWNLOAD_URL"

# Extract
# tar xzf "${FILE}.tar.gz" > /dev/null 2>&1
tar xzf "${FILE}.tar.gz"

echo "Wait a sec..."

# Install
cd ${FILE}
{ ./configure && make; } > /dev/null 2>&1
sudo make install > /dev/null 2>&1

cd ..

# Cleanup
rm -rf "${FILE}"
rm -f "${FILE}.tar.gz"

echo "${NAME} ${VER} installed successfully!"
