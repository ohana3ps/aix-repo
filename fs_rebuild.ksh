#!/usr/bin/ksh93  
  
function usage {  
    print "Usage:\n\tfs_builder [volume group]\n"  
    print "\tPrints out syntax to recreate all filesystems in [volume group]"  
}  
  
if (( $# == 0 )); then  
    usage  
    exit 0  
fi  
  
VG=$1  
FILESYSTEMS=(`lsvg -l $VG | egrep -v "$VG|^LV|N\/A" | awk '{print $7}'`)  
JFSLOGS=(`lsvg -l $VG | egrep "jfslog|jfs2log" | awk '{print $1}'`)  
  
for fs in ${FILESYSTEMS[@]}; do  
    lv=`lsvg -l $VG | grep $fs$ | awk '{print $1}'`  
    fstype=`lsvg -l $VG | grep $fs$ | awk '{print $2}'`  
    pps=`lsvg -l $VG | grep $fs$ | awk '{print $3}'`  
    #print "$fs $lv $fstype $pps $mgroup $log $fs_owner $fs_group $VG"  
    case $VG in  
        rootvg|srevg|paging*)  
            print "mklv -t $fstype -c 2 -y $lv $VG $pps"  
            ;;  
        *)  
            print "mklv -t $fstype -a e -e x -y $lv $VG $pps"  
            ;;  
    esac  
done  
  
for jfslog in ${JFSLOGS[@]}; do  
    lv=$jfslog  
    fstype=`lsvg -l $VG | grep $jfslog | awk '{print $2}'`  
    pps=`lsvg -l $VG | grep $jfslog | awk '{print $3}'`  
    case $VG in  
        rootvg|srevg|paging*)  
            print "mklv -t $fstype -c 2 -y $lv $VG $pps"  
            ;;  
        *)  
            print "mklv -t $fstype -e x -y $lv $VG $pps"  
            ;;  
    esac  
done  
  
for fs in ${FILESYSTEMS[@]}; do  
    log=`mount | grep "$fs " | awk -F "log=" '{print $2}'`  
    lv=`lsvg -l $VG | grep $fs$ | awk '{print $1}'`  
    fstype=`lsvg -l $VG | grep $fs$ | awk '{print $2}'`  
    pps=`lsvg -l $VG | grep $fs$ | awk '{print $3}'`  
    mgroup=`grep -p $fs: /etc/filesystems | grep type | awk '{print $3}'`  
    fs_owner=`ls -ld $fs | awk '{print $3}'`  
    fs_group=`ls -ld $fs | awk '{print $4}'`  
    if (( `echo $VG | egrep -c "rootvg|srevg|paging"` == 0 )); then  
        case $fs in  
            *redo*|*mirrlog*|*origlog*)  
                options="-a agblksize=512 -a options=cio"  
                ;;  
            *sapdata*|*/data*|*ctl*)  
                options="-a options=cio"  
                ;;  
            *)  
                options="-a options=rbrw"  
                ;;  
        esac  
    fi  
    print "crfs -v $fstype -d $lv -m $fs -A no -p rw -t no -u $mgroup -a logname=$log $options"  
done  
  
for fs in ${FILESYSTEMS[@]}; do  
    fs_owner=`ls -ld $fs | awk '{print $3}'`  
    fs_group=`ls -ld $fs | awk '{print $4}'`  
    print "mount $fs"  
    print "chown $fs_owner:$fs_group $fs"  
done  
