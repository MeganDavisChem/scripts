#!/bin/bash

search="EOM State"

#Get minimum energy
min=$(grep "$search" *.com.dat | awk '{print $NF}' | sort | tail -1);

#Get relative energy
grep "$search" *.com.dat | awk -v min=$min '{printf("%14.12f\n",$NF-min)}'
