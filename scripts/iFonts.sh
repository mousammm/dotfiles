#!/bin/bash

echo "started installing fonts"
sudo mv ~/dotfiles/asset/goku /usr/share/fonts/
sudo fc-cache -fv > /dev/null 2>&1
echo "installation done..."
ls /usr/share/fonts/goku
