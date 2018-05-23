#!/usr/bin/ksh
lsdev -cdisk|grep Virtual
for x in `lsdev -cdisk|grep Virtual|awk  '{print $1}'`;do lspv|grep $x;done
