#!/bin/sh

############################################################
# 'recording' module for dwmblocks
#
# <description>
############################################################

# appearance
icon='\u'
color='\x'

# output formats
formats=()
source "/home/percy/.wm/dwmblocks/handler.sh"

# final output
output=""
get_index recording && \ 
printf "$color$icon $output"
