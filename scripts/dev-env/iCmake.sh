#!/bin/bash
set -e

# wget tar stow
NAME="CMake"
VER="4.3.1"
ARC="x86_64"
PLATFORM="linux"
FILE="cmake-${VER}-${PLATFORM}-${ARC}"
URL="https://github.com/Kitware/CMake/releases/download/v${VER}/${FILE}.tar.gz"

PKGS_DIR="/usr/local/PKGS"
TARGET_DIR="/usr/local"

# --- Uninstalling ---
if [ "$1" == "69" ]; then
    echo "Uninstalling ${NAME}-${VER}..."
    if [ -d "${PKGS_DIR}/${NAME}-${VER}" ]; then
        sudo stow -d "${PKGS_DIR}" -t "${TARGET_DIR}" -D "${NAME}-${VER}"
        sudo rm -rf "${PKGS_DIR}/${NAME}-${VER}"
        echo "Successfully unstowed and removed."
    else
        echo "Error: ${NAME}-${VER} not found in ${PKGS_DIR}."
    fi
    exit 0
fi
# --------------------

echo "Downloading ${NAME} ${VER}..."
wget -q --show-progress "$URL"

sudo mkdir -p "${PKGS_DIR}/${NAME}-${VER}"
echo "Extracting to ${PKGS_DIR}/${NAME}-${VER}..."
sudo tar -xzf "${FILE}.tar.gz" -C "${PKGS_DIR}/${NAME}-${VER}" --strip-components=1

echo "Stowing ${NAME}-${VER} to ${TARGET_DIR}..."
sudo stow -d "${PKGS_DIR}" -t "${TARGET_DIR}" -S "${NAME}-${VER}"

rm "${FILE}.tar.gz"
echo "${NAME} ${VER} installed successfully!"
