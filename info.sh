#!/usr/bin/ksh

if [ "`uname`" = "AIX" ]; then
printf "This server is running AIX level           : "
oslevel -s
echo "CPU and Memory info: "
lparstat -i | egrep "^Mode|^Entitled Capacity  |^Online Memory"
echo "------------------------------"
else
echo "This is not an AIX server"
fi
