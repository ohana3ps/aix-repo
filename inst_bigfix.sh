#!/usr/bin/ksh
mount bkpnbu05pakr:/export/nim/software/BigFix /mnt
installp -agqYXd /mnt/BESAgent-9.2.7.53.ppc64_aix61.pkg BESClient
cp -p /mnt/masthead.afxm /etc/opt/BESClient/actionsite.afxm
/etc/rc.d/rc2.d/SBESClientd start
umount /mnt
