for x in `df -g|grep -v ":"|awk '0+$4 >= 90 {print $7}'`;do
        echo "$x is over 90% full";
done
