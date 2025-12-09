#!/bin/bash

while true; do
    datetime=$(date '+%a %d %b | %I:%M:%p')
    xsetroot -name "$datetime"
    sleep 60
done
