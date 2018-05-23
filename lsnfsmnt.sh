#!/usr/bin/ksh

lsfs|grep -i nfs|awk '{print $1,"-", $4}'
