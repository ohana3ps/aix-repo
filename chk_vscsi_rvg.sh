#!/usr/bin/ksh
lsdev|grep vscsi  >/dev/null 2>&1
if [ $? -eq 0 ]
   then
    for x in `sanlun lun show|grep rvg|awk '{print $3}'`;
    do 
    echo "netapp rootvg lun = $x";
    lspv |grep $x;
    bootlist -om normal |grep $x|head  -n1
    done
fi

