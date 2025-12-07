#!/bin/bash

HOST_NAME=$(cat /etc/hostname)
USER_NAME=$(whoami)

echo "$HOST_NAME"@"$USER_NAME"
