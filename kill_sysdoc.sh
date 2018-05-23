#!/usr/bin/ksh

for x in `ps -ef|grep aix_sysdoc.sh |grep -v grep|awk '{print $2}'`;do kill -9 $x;done
