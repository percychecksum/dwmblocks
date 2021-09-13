#!/bin/bash

#############################################################
# Simple configuration handler for the layout of
# each dwmblocks statusbar module.
#
# @authors perchychecksum, lightbluecrab
#
#############################################################

path="$HOME/.wm/dwmblocks"
layout="$path/profiles/default.conf"





############################################################
# Writes timestamp and error message to stdout.
############################################################
error() {
    echo "[$(date +'%Y-%m-%d, %H:%M:%S')]: $*" >> error.log
}