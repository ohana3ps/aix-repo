#!/usr/bin/ksh
OVG=`lsvg |grep old`
UPT=`uptime|awk '{print $3, $4}'`
echo "system has been up for $UPT. Please remove $OVG"

