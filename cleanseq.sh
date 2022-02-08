#!/bin/bash

for ((i=1; i <=124; i++));
do
    j=$(printf "%03d" $i)
    if [ $i -eq 75 ] || [ $i -eq 80 ] || [ $i -eq 68 ]
    then
        echo $i
    else
        echo
#        ssh n$j 'rm -r /tmp/r2610/*'
        ssh n$j 'cd /tmp/r2610; du -hs'
    fi
done
