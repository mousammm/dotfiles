#!/bin/bash

VER="22.1.0"
FILE="clangd-linux-${VER}"
URL="https://github.com/clangd/clangd/releases/download/${VER}/${FILE}.zip"
wget -q --show-progress ${URL}

unzip ${FILE}.zip 
rm ${FILE}.zip

PREFIX=/usr/local
sudo mv ./clangd_$VER/bin/* $PREFIX/bin/
sudo mv ./clangd_$VER/lib/* $PREFIX/lib/
