#!/bin/ksh
# stop  hpomi agent
/usr/lpp/OV/bin/ovc -stop
# start hpomi agent
/usr/lpp/OV/bin/ovc -start
# hpomi agent status
/usr/lpp/OV/bin/ovc -status
