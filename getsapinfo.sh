#!/usr/bin/ksh

# Find SAP version
ps -ef|grep sapstartsrv|grep -v grep >> /tmp/0064fr23.out
if [ $? -eq 0 ]; then
        SAP_SID=$(for x in `df -g|grep sap|grep "/usr/sap"|head -n1|awk '{print $7}'`;do ls -ld $x|awk '{print $3}';done)
        ( su - $SAP_SID " -c disp+work "  2> /dev/null )
                rm /tmp/0064fr23.out
else
        SAP_VER=" "
                rm /tmp/0064fr23.out
fi

