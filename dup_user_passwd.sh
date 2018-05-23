#!/usr/bin/ksh

for user in `lsuser -a ALL`; do 
        [ -n "$1" -a "$user" != "$1" ] && continue
        if grep -p ^${user}: /etc/security/passwd | grep -q "password = "; then
                hash=`grep -p ^${user}: /etc/security/passwd | grep "password = " | awk -F " = " '{print $2}'`
                echo "echo '${user}:${hash}' | chpasswd -ec"
        fi
done
