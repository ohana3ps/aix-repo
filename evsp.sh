#!/usr/bin/ksh
# script to enable vscsi paths

# Define variables
DSK=`lspath |grep -v Enabled|grep vscs|awk '{print $2}'`
PTH=`lspath |grep -v Enabled|grep vscs|awk '{print $3}'`

# command to run
chpath -l $DSK -p $PTH -s enable
