#!/usr/bin/ksh

for x in `lsdev |grep -i shared|awk '{print $1}'`;do entstat -drt $x|grep "VLAN Tag";done
