#!/usr/bin/ksh
ps -ef|grep db2sysc|grep -v grep >> /tmp/0002fr30.out

if [ $? -eq 0 ]; then
        DB2_SID=$(for x in `df -g|grep db2|grep data|head -n1|awk '{print $7}'`;do ls -ld $x|awk '{print $3}';done)
        ( su - $DB2_SID " -c db2level" |grep Informational|awk '{print $5}'|sed 's/.\{2\}$//' 2> /dev/null )
		rm /tmp/0002fr30.out
else
        echo "No DB2 "
fi
