#!/bin/bash

#############################################################
# Simple configuration handler for the layout of
# each dwmblocks statusbar module.
#
# 
#
#############################################################

d_signal=5
layout='/home/emil/.wm/dwmblocks/layout.conf'


############################################################
# Get layout index of specific attribute.
# Arguments:
#   $1 - attribute name
# Returns:
#   $index - current index of given attribute
############################################################
get_index() {
    if [ $# -eq 1 ]; then
        index=$(grep -E "^$1\s" $layout | awk '{print $2}') 
    fi
}


############################################################
# Change index of attribute in the config file.
# Arguments:
#   $1 - attribute name
#   $2 - new index
# Returns:
#   (updated config file)
############################################################
edit_attribute() {
    if [ $# -eq 2 ]; then
        sed -i "s:^$1.*:$1\t$2:" $layout
        awk -i inplace '{ printf "%-10s %s\n", $1, $2 }' $layout
    fi
}


############################################################
# In/decrement index of given attribute.
# Arguments:
#   $1 - attribute name
#   $2 - max-length
#   $3 - signal
# Returns:
#   (updated config file)
############################################################
update_index() {
    
    if [ $# -eq 3 ]; then

        get_index $1
        
        # in/decrement index
        index=$([ $3 -eq $d_signal ] && echo $((index-1)) \
                        || echo $((index+1)))

        # possibly shift values
        if [ $index -ge $2 ]; then
            index=0
        elif [ $index -lt 0 ]; then
            index=$(($2-1))
        fi

        # write changes
        edit_attribute $1 $index

    fi

}


############################################################
# Writes timestamp and error message to stdout.
############################################################
error() {
    echo "[$(date +'%Y-%m-%d, %H:%M:%S')]: $*" >> error.log
}