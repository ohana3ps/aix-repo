#!/usr/bin/bash
#############################################################################
##  Description of script                                                  ##
##                                                                         ##
#############################################################################

# Break down into steps
HSTN=`hostname`
for X in `lsdev|grep "Standard Ethernet"|awk '{print $1}'`
	do
	i=0
	lsattr -E -F value -l $X > /tmp/tmp.out
	mapfile -t Y < /tmp/tmp.out
	echo -n "$HSTN, $X, " >> /local/sysdoc/tmp/file
		while (( i <= 20 ))
    		do
        	echo -n "${Y[$i]}, "
        	((i=i+1))
    	done >> /local/sysdoc/tmp/file
    rm /tmp/tmp.out
    echo " " >> /local/sysdoc/tmp/file
done
