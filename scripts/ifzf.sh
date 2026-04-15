#!/bin/bash

# wget tar mv ln

set -e
NAME="fzf"
LOC="/usr/local"

sudo rm -f ${LOC}/bin/${NAME}      # binary

VERSION="0.71.0"
FILE="fzf-0.71.0-linux_amd64.tar.gz"
DOWNLOAD_URL="https://github.com/junegunn/fzf/releases/download/v${VERSION}/${FILE}"

# Download 
echo "Downloading ${NAME} ${VERSION}..."
wget -q --show-progress "$DOWNLOAD_URL"

# Extract
tar xzf "$FILE"

# Install
sudo mv "./$NAME" ${LOC}/bin/${NAME}

# Cleanup
rm "$FILE"

echo "${NAME} ${VERSION} installed successfully!"
