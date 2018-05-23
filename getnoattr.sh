#!/usr/bin/ksh
#############################################################################
# Script to gather network tunables from multiple systems into csv file for #
# comparison ideally used in ssh or dsh loop into command access file.      #
#############################################################################

# Setup array AR1 with values from no command
TMP=`no -a |awk '{print $3}'`
eval set -A AR1 $TMP

# add hostname to beginning of the line
HSTN=`hostname`
echo "$HSTN, \c" >> /local/sysdoc/tmp/sapecc_no.csv

# while loop to make single line CSV output to file
i=0
while (( i <= 145 ))
    do
        echo "${AR1[$i]}, \c"
        ((i=i+1))
    done >> /local/sysdoc/tmp/sapecc_no.csv

# used for carriage return at end of line
echo " " >> /local/sysdoc/tmp/sapecc_no.csv
