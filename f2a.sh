#!/usr/bin/ksh
#
# Read file $FILE in $array[*]
#

set -A array
typeset -i array_index=0
while read array[$((array_index+=1))] ; do
 :
done < $0

#
# Print array
#

typeset -i index=0
while (( $((index+=1)) < ${#array[*]} )) ; do
   printf "[%3d] %s\n" $index "${array[$index]}"
done < ./test.file
