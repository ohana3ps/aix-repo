#!/usr/bin/ksh

for x in `lspv|grep -w rootvg|awk '{print $1}a`;do lspv $x|grep "FREE PPs"|awk '{print "RootVG",$1,"- ",$4,$5}';done
