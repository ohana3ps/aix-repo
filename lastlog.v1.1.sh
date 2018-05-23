#!/usr/bin/ksh
for user in $( awk -F: '{ print $1}' /etc/passwd | sort)
do
lastlog=$(lsuser -a time_last_login $user | awk -F'=' '{print $NF}')
echo "$user - \c" >> /tmp/lastlog.txt; perl -MPOSIX -le "print strftime '%m/%d/%Y', localtime($lastlog);" >> /tmp/lastlog.txt
done

hstnm=$(hostname)
grep -v 1969 /tmp/lastlog.txt |sort  -k7,7 -k4,4 -k5,5 > /local/logs/$hstnm.lastlog.`date +%m%d%y`.txt
