#!/bin/ksh

check_auth()
{

if [[ `whoami` != "root" ]]
then
        clear
        echo "\n\n\n\t W A R N I N G ! ! !"
        echo "\n\n\t You will not be able to execute this script as regular user !"
        echo "\n\t Please su to root and then run the script. "
        exit 1
fi
}


single_user()

{

chk_valid=`cat /etc/passwd|awk -F: '{print $1}'|grep -i $inp`

if [[ -z $chk_valid ]];then
        echo "\n\n$inp is not a valid user on this system ... please try again\n\n"
        exit 1
fi

mxage=`lsuser -a maxage $inp|awk -F = '{print $2}'`
maxage_in_sec=`expr $mxage \* 604800`
lstupd=`grep -p $inp /etc/security/passwd|grep -i lastupdate|awk '{print $3}'`

if [[ ! -z $lstupd ]];then
        expired_sec=`expr $lstupd \+ $maxage_in_sec`
        expired_date=`perl -e "print scalar localtime($expired_sec)"`
        todays_in_sec=`date +%s`

                if [[ $expired_sec -lt $todays_in_sec ]];then
                        echo "\n\nPassword for $inp \texpired on $expired_date\n\n"
                else
                        echo "\n\nPassword for $inp \twill expire on $expired_date\n\n"
                fi
else
        continue
fi

}

all_users()

{

for i in `cat /etc/passwd |awk -F: '{print $1}'`
do
mxage=`lsuser -a maxage $i|awk -F = '{print $2}'`
maxage_in_sec=`expr $mxage \* 604800`
lstupd=`grep -p $i /etc/security/passwd|grep -i lastupdate|awk '{print $3}'`

if [[ ! -z $lstupd ]];then
        expired_sec=`expr $lstupd \+ $maxage_in_sec`
        expired_date=`perl -e "print scalar localtime($expired_sec)"`
        todays_in_sec=`date +%s`

                if [[ $expired_sec -lt $todays_in_sec ]];then
                        echo "\nPassword for $i \texpired on $expired_date"
                else
                        echo "\nPassword for $i \twill expire on $expired_date"
                fi
else
#       echo "$i not valid"
        continue
fi

done

}

check_auth

inp=$1
if [ -z "$inp" ] ; then
        all_users
else
        single_user
fi