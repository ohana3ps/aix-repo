#!/usr/bin/sh
#############################################################################
##  Description of script                                                  ##
##                                                                         ##
#############################################################################

# Break down into steps
# mount share 
mount aixmgt01dakr:/global /local/sysdoc
# set hostname varrible
HSTN=`hostname -s`
# Match hostname to environment
while read line; do
	if [ $line = $HSTN ]; then BU="BSA" 
	fi;
done < /local/sysdoc/tmp/bsa

while read line; do
	if [ $line = $HSTN ]; then BU="BSLA" 
	fi;
done < /local/sysdoc/tmp/bsla

while read line; do
	if [ $line = $HSTN ]; then BU="BSRO" 
	fi;
done < /local/sysdoc/tmp/bsro

OS_VER=`oslevel |cut -f 1,2 -d . `
TL_VER=`oslevel -s|cut -f 2 -d - `
SP_VER=`oslevel -s|cut -f 3 -d - `
ssh -v santa 2> /tmp/sshver.info
SSH_VER=`head -n1 /tmp/sshver.info|awk '{print $1}'|cut -d _ -f2|sed 's/.$//'`
SSL_VER=`head -n1 /tmp/sshver.info|awk '{print $3}'`
rm -r /tmp/sshver.info
NetApp_VER=`sanlun version 2> /dev/null`
CV_VER=`/opt/commvault/Base/Galaxy -status|grep Version|awk '{print $3, $4}' 2> /dev/null`
HPE_VER=`/usr/lpp/OV/bin/ovc -version|awk '{print $4}' 2> /dev/null`
J7_32B=`lslpp -l|grep -i java|grep Runtime|grep Java7.jre|uniq|awk '{print $2}' 2> /dev/null`
J7_64B=`lslpp -l|grep -i java|grep Runtime|grep Java71_64.jre|uniq|awk '{print $2}' 2> /dev/null`
J8_64B=`lslpp -l|grep -i java|grep Runtime|grep Java8|uniq|awk '{print $2}' 2> /dev/null`
SMB_VER=`smbd -V|awk '{print $2}' 2> /dev/null`
PRL_VER=`perl -v|grep "This is perl"|awk '{print $4}' 2> /dev/null`
BSH_VER=`bash --version|grep "GNU bash"|awk '{print $4}'|cut -f 1 -d -`
SDO_VER=` sudo -V |grep "Sudo version "|awk '{print $3}'`
CYB_VER=`cd /apps/cybermation/ESPSystemAgent; ./cybAgent -v|grep Version|awk '{print $2,$3,$4}'| perl -pi -e "s/,//g;" 2> /dev/null`
# Find Db2 version
ps -ef|grep db2sysc|grep -v grep >> /tmp/0002fr30.out
if [ $? -eq 0 ]; then
        DB2_SID=$(for x in `df -g|grep db2|grep data|head -n1|awk '{print $7}'`;do ls -ld $x|awk '{print $3}';done)
        DB2_VER=`( su - $DB2_SID " -c db2level" |grep Informational|awk '{print $5}'|sed 's/.\{2\}$//' 2> /dev/null )`
		rm /tmp/0002fr30.out
else
        DB2_VER=" "
		rm /tmp/0002fr30.out
fi
# Find if Patrol is installed
mount /apps/patrol 2> /dev/null
if [ -f "/apps/patrol/Patrol3/PatrolAgent" ]
	then
	PTRL="yes"
else
	PTRL="no"
fi

# ouput
echo "$BU, $HSTN, $OS_VER, $TL_VER, $SP_VER, $BSH_VER, $CV_VER, $CYB_VER, $DB2_VER, $HPE_VER", $J7_32B, $J7_64B, $J8_64B, $NetApp_VER, $PTRL, $PRL_VER, $SMB_VER, \
$SSH_VER, $SSL_VER, $SDO_VER >> /local/sysdoc/tmp/software.csv
