#!/bin/bash

NAME="Iosevka"
VER="3.4.0"
URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v${VER}/${NAME}.zip"
LOC="/usr/share/fonts"

sudo rm -rf ${LOC}/${NAME}

echo "Downloading ${NAME} ${VER}"
wget -q --show-progress ${URL}

echo "Extracting..."
unzip -q ${NAME}.zip -d ${NAME}

sudo mkdir -p ${LOC}/${NAME}
sudo mv ${NAME}/*.ttf ${LOC}/${NAME}/

# Cleaning 
rm -rf ${NAME}
rm -f ${NAME}.zip

sudo fc-cache -fv > /dev/null 2>&1

echo "${NAME} font installed into system..."
