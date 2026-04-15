#!/bin/bash

# wget tar mv ln
set -e

NAME="yazi"
LOC="/usr/local"

sudo rm -f ${LOC}/bin/${NAME}      # binary
sudo rm -rf ${LOC}/lib/${NAME}     # src

VERSION="26.1.22"
FILE="yazi-x86_64-unknown-linux-gnu.zip"
DIR="yazi-x86_64-unknown-linux-gnu"
DOWNLOAD_URL="https://github.com/sxyazi/yazi/releases/download/v${VERSION}/${FILE}"

# Download 
echo "Downloading ${NAME} ${VERSION}..."
wget -q --show-progress "$DOWNLOAD_URL"

# Extract
unzip -q "$FILE"

# Install
sudo mv "$DIR" ${LOC}/lib/${NAME}
sudo ln -sf ${LOC}/lib/${NAME}/${NAME} ${LOC}/bin/${NAME}

# Cleanup
rm "$FILE"

echo "${NAME} ${VERSION} installed successfully!"
