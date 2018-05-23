#!/bin/ksh

FS=`df -g $1| awk '0+$4 >= 80 {print $7}'`

if [ "$FS" = "$1" ]; then
        echo "$FS is over 80% full"
fi
