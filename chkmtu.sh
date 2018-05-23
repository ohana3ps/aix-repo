#!/usr/bin/ksh

for x in `lsdev|grep -w "Standard Ethernet Network Interface"|awk '{print $1}'`;
do 
echo "$x - \n"
lsattr -El $x|grep -w "mtu"|awk '{print $2}';
done
