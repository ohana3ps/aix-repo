#!/usr/bin/ksh

for x in `lsdev|grep -w "Standard Ethernet Network Interface"|awk '{print $1}'`;
do 
lsattr -El $x|grep  "tcp_mssdflt"|grep 8952
done
