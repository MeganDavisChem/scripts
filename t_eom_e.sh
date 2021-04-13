#!/bin/bash

search="excited state energy"

#Get minimum energy
min=$(grep "$search" *.out | awk '{print $NF}' | sort | tail -1);

#Get relative energy
grep "$search" *.out | awk -v min=$min '{printf("%14.12f\n",$NF-min)}'
