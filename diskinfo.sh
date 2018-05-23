#!/usr/bin/ksh 
TOTAL=0 
for ff in $(lspv | awk '{ print $1 }') 
do 
size=$(bootinfo -s $ff) 
((TOTAL=TOTAL+size)) 
done 
echo $TOTAL 
