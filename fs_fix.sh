#!/bin/ksh

FS=`df -g /usr| awk '0+$4 >= 90 {print $7}'`

if [ "$FS" = "/usr" ]; then
        echo "$FS is over 90% full"
        echo "Growing $FS by 256MB"
	chfs -a size=+256M $FS
	echo " "
	echo "New $FS size"
	df -g $FS
fi
