#!/bin/bash

search="CCSD(T) t"

#Get minimum energy
min=$(grep "$search" *.com.dat | awk '{print $NF}' | sort | tail -1);

#Get relative energy
grep "$search" *.com.dat | awk -v min=$min '{printf("%15.12f\n",$NF-min)}'
