#!/usr/bin/sh
#############################################################################
##  Description of script                                                  ##
##                                                                         ##
#############################################################################

# Delete file
rm -rf /local/sysdoc/tmp/software.csv
rm -rf /local/sysdoc/tmp/header.csv
rm -rf /local/sysdoc/tmp/software_list.csv

dsh -N all -e /home/jhoaglan/bin/software_inventory.sh
cat /local/sysdoc/tmp/software.csv| sort -k2 > /local/sysdoc/tmp/software_list.csv
#setup csv headers
echo "BU, Hostname, OS Level, TL Level, SP Level, Bash, CommVault, Cybermation, DB2, HPE OMi, Java7 32Bit, Java7 64Bit, Java 8, NetApp ver, Patrol Installed, Perl, Samba, SSH ver, SSL ver, Sudo" > /local/sysdoc/tmp/header.csv
cat /local/sysdoc/tmp/header.csv /local/sysdoc/tmp/software_list.csv > /local/sysdoc/tmp/software.csv


# Email file
list="unixadmins@sharepoint.bsaconnect.com "
mail -s "AIX Software Report" $list <<mayday
hello,
Here are the files attached .
JH

~<!uuencode /local/sysdoc/tmp/software.csv AIX_Software_List.csv

mayday
