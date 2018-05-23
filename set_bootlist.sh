#!/usr/bin/ksh

for x in `lspv|grep rootvg|awk '{print $1}'`;do bootlist -om normal $x;done
