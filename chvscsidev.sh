#!/usr/bin/ksh
for x in `lsdev |grep vscsi|awk '{print $1}'`;do
chdev -l $x -a vscsi_path_to=30 -P;
chdev -l $x -a vscsi_err_recov=fast_fail -P;
done
