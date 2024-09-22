#!/usr/bin/env bash
#
# requires ddcuitl
# This script changes brightness on each display to the given value

# required module for ddc/ci to work
# if module not loaded load it
if [ "$(lsmod | grep i2c_dev | awk '{print $1}')" != "i2c_dev" ]; then
    printf %b "i2c-dev module is not loaded!\n"
    modprobe i2c-dev || sudo modprobe i2c-dev
fi

ddcutil --brief detect | grep Display | sed s/Display\ //g | xargs -I{} ddcutil -d {} setvcp 0x10 "$1"
