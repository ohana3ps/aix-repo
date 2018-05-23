#!/usr/bin/ksh
chdef -a vscsi_path_to=30 -c adapter -s vdevice -t IBM,v-scsi
chdef -a vscsi_err_recov=fast_fail -c adapter -s vdevice -t IBM,v-scsi
