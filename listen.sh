#!/usr/bin/ksh
print "Port            PID              Process"
netstat -Aan | grep LISTEN | awk '{print $1 " " $5}' | while read pcb port; do
        out=`rmsock $pcb tcpcb`
        if echo "$out" | grep "Kernel Extension" > /dev/null; then
                printf "%-15s Kernel Extension\n" "$port"
        else
                pid=`echo "$out" | sed -n 's/.*pro[c]*ess \([0-9][0-9]*\) .*/\1/p'`
                if [ -n "$pid" ]; then
                        proc=`ps -p $pid | tail -n 1 | awk '{print $4}'`
                        printf "%-15s %-16s $proc\n" "$port" $pid
                else
                        echo "Error, Line not recognized \"$out\" for Port $port"
                fi
        fi
done
