#!/bin/bash

free -h | awk '/^Mem:/ {print $3 "/" $2}'  # 500Mim/8gb  RAM

# lm-sensors for cpu temp
