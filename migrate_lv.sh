#!/bin/ksh

vg=`lsvg|grep aix`
lv=`lsvg -l $vg|grep -v vg|grep -v LV|awk '{print $1}'`
hd=`lspv|grep $vg|awk '{print $1}'`
clear
echo "non-rootvg is $vg\n"
echo "LVs in $vg are:"
echo "$lv\n"
echo "hdisks in $vg are:"
echo "$hd\n"
echo "Enter hdisk to migrate LVs from:"
read from <&1 
echo "\nEnter hdisk to migrate LVs to:"
read to <&1 
echo "\nMigrating LVs from $from to $to: \n"
lsvg -l $vg|grep -v vg|grep -v LV|awk '{print $1}' > /tmp/tmpfile
echo "Review the migratepv commands \n"
while read line; do echo "migratepv -l $line $from $to" >>/tmp/mglvtmp;done < /tmp/tmpfile
cat /tmp/mglvtmp
echo "\nDo you whis to execute? [Y/N]"
read answer <&1 
if [ $answer = y ]
	then 
	echo "\nrunning commands: "
    while read line; do echo $line;$line;done < /tmp/mglvtmp
    rm /tmp/mglvtmp
    rm /tmp/tmpfile
else
    echo "\nexiting"      
    rm /tmp/mglvtmp  
    rm /tmp/tmpfile
fi
echo "\nThe operation has completed.\n"
