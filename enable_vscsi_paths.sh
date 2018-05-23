#!/usr/bin/ksh
for x in `lsdev -cdisk|grep "Virtual SCSI Disk Drive"|awk '{print $1}'`;
do chpath -l $x -p vscsi0 -s enable;
chpath -l $x -p vscsi1 -s enable;
done
