#!/usr/bin/ksh
for x in `lsdev -cdisk|grep Virtual|awk  '{print $1}'`;do rmdev -dl $x;done
