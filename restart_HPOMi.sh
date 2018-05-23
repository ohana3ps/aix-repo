#!/usr/bin/ksh
export PATH=$PATH:/usr/lpp/OV/bin

opcagt -stop
ovc -stop
ovc -kill
ovc -start CORE
opcagt -cleanstart

