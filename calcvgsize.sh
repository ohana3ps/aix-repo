#!/bin/ksh

for x in `lsvg | grep -v rootvg`;do echo "- $x - \c";lsvg $x |grep "TOTAL PPs"|awk '{print $7,$8}';done
