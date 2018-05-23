for x in `lsdev|grep fcs|sort| awk '{print $1}'`
do echo $x
lsdev -dev $x -vpd|grep -i network
done
