#!/usr/bin/ksh

for x in `lsdev|grep -w "Standard Ethernet Network Interface"|awk '{print $1}'`;
do 
echo "$x - \c"
lsattr -El $x|grep -w "rfc1323";
done
