#!/usr/bin/ksh
umount /mnt
for x in `df -g /opt|tail -n1|awk '0+$3 <= 1 {print $7}'`;do
  echo "$x is less that 1GB";
  echo "adding 512MB to /opt"
  chfs -a size=+512M /opt
done
mount bkpnbu05pakr:/export/nim/software/CommVault/CV11SP8 /mnt
/mnt/silent_install -upgrade Instance001 -log /var/log/commvault/Log_Files/cv11sp6_update.log
sleep 5
umount /mnt
