#1/bin/ksh

for x in `lspv|grep -v rootvt|awk '{print $1}'`;do sanlun lun show |grep $x|awk '{print $6}';done
