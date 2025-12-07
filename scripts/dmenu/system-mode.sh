#!/bin/bash

# dmenu power options script
choice=$(echo -e "Shutdown\nReboot" | dmenu -p "Power:")

case "$choice" in
    "Shutdown") poweroff ;;
    "Reboot") reboot ;;
esac
