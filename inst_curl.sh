#!/bin/ksh

mount bkpnbu05pakr:/export/nim/software /mnt

rpm -ihv /mnt/curl-7.9.3-2.aix4.3.ppc.rpm

sleep 2

rpm -qa |grep curl

umount /mnt

