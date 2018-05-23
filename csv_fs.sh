#!/usr/bin/ksh
#############################################################################
##  Description of script                                                  ##
##                                                                         ##
#############################################################################

# Break down into steps
HSTN=`hostname`
for x in `df -g |grep -v ":"|grep -v Filesystem|awk '{print $7}'|sort`;
do echo "$HSTN, $x" >> /local/sysdoc/tmp/filesystems;
done
for x in `df -g |grep ":"|grep -v Filesystem|awk '{print $7}'|sort`;
do echo "$HSTN, , $x"  >> /local/sysdoc/tmp/filesystems;
done
