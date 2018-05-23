#!/usr/bin/ksh

/opt/com*/Base/Galaxy status|grep Version|awk '{print $4}'
