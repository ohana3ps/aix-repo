#!/bin/ksh
#############################################################################
##
## NAME:	daily_hmcscan.sh
##
## VERSION:	1
##
## PURPOSE:	Run HMC Scanner daily
##
## USAGE:	daily_hmcscan.sh	<must be run as root>
##
## MODIFICATIONS:
##		11/15    JLH	Ver 1.0 modified from sync_host.sh
##		
##
##############################################################################

trap '' 1 2 3 13 15

trap ' 
        if [ "$exit_stat" -eq 0 ]
        then
                write_log F 0x9999 finish successful
        else
                write_log F 1x9999 finish "failed $exit_stat"
        fi
#        tail -5000 $log > $log.o &&  { mv $log.o $log; chmod 666 $log; }
        exit $exit_stat
        ' 0


. /local/bin/gen_fun.sh
gen_initial
log=$log_dir/`basename $0 .sh`.log
exit_stat=9

write_log S 0x0000 start none

##-----------------------------------------------------------
## Run HMC Scanner
##-----------------------------------------------------------


/export/nim/software/hmcScanner/hmcScanner.ksh hmc1 hscroot -dir /local/sysdoc/ -key $HOME/.ssh/id_rsa -stats -html -htmldir /local/sysdoc/hmc/

write_log  R 9x0010 "HMC Scan Running"

exit_stat=0

exit 0