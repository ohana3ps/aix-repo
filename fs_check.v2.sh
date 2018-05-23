#!/bin/ksh

for x in `df -g|grep -v ":"|awk '0+$4 >= 90 {print $7}'`;do
        echo "$x is over 90% full";
    if [ "$x" = "/" ]; then
        echo "Adding 1GB to $X ";
   		chfs -a size=+1G $x;
	fi
	    if [ "$x" = "/usr" ]; then
        echo "Adding 1GB to $X ";
   		chfs -a size=+1G $x; 
	fi
	    if [ "$x" = "/var" ]; then
        echo "Adding 1GB to $X ";
   		chfs -a size=+1G $x; 
	fi
		if [ "$x" = "/local" ]; then
        echo "Adding 1GB to $X ";
   		chfs -a size=+1G $x; 
	fi
done
