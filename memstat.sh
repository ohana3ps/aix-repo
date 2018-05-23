#!/usr/bin/ksh
/usr/bin/renice -n -20 -p $$

while [ true ]; do
echo `date` "-->" `svmon -G | head -2 | tail -1` "-->" `vmstat -v | grep numperm` >> svmon.out &
echo `date` "-->" `svmon -G | head -3 | tail -1` >> paging.out &
echo `vmstat -Iwt 1 1 | tail -1` >> vmstat.out &
sleep 60
done
