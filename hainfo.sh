#!/usr/bin/ksh
if [ -s /local/hacmp/ha.log ]
	then
		export PATH=$PATH:/usr/es/sbin/cluster:/usr/es/sbin/cluster/utilities:/usr/es/sbin/cluster/sbin:/usr/es/sbin/cluster/cspoc
		HSTN=`hostname`	
		echo "OS Version: \c"
		oslevel -s
		echo "Cluster Version: \c"
		halevel -s
		cldump|grep "Node Name"|grep $HSTN
		cldump|tail -n2|grep $HSTN|awk '{print $1,$2}'
	else
		exit
fi
