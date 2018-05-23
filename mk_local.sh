#!/usr/bin/ksh
# setup AIX backup scripts
crfs -v jfs2 -g rootvg  -a size=1G -m /local -A yes  -p rw 
mount /local
mkdir -p /local/{bin,functions,log}
