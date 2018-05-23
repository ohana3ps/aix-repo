#!/usr/bin/ksh
HSTNM=`hostname`
if [ -s /var/hacmp/log/hacmp.out ]
        then
	        export PATH=$PATH:/usr/es/sbin/cluster:/usr/es/sbin/cluster/utilities:/usr/es/sbin/cluster/sbin:/usr/es/sbin/cluster/cspoc
                PHA_VER=`halevel -s`
		SYS=`prtconf |grep "System Model"|awk '{print $3}'`
		PWR=`prtconf |grep "Implementation Mode"|awk '{print $4 $5}'`
		CPU=`lparstat -i|grep -w "Entitled Capacity"|head -n1|awk '{print $4}'`
		MEM=`lparstat -i|grep "Online Memory"|awk '{print $4}'`
        else
		exit
fi

echo "$HSTNM, $PHA_VER, $SYS, $PWR, $CPU, $MEM" >> /local/sysdoc/tmp/powerha_info.csv
