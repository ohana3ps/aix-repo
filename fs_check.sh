#!/bin/ksh

FS=`df -g /usr| awk '0+$4 >= 90 {print $7}'`

if [ "$FS" = "/local" ]; then
        echo "$FS is over 90% full"
fi
