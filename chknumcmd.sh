#!/usr/bin/ksh

for x in `lsdev|grep fcs|awk '{print $1}'`;
do 
echo "$x - \c"
lsattr -El $x -a num_cmd_elems|awk '{print $1, $2}';
done
