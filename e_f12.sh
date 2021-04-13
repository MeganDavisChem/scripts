#!/bin/bash

#Get minimum energy
#smart way!
min=$(grep "\!" *.out | grep "F12b" | awk '{print $NF}' | sort | tail -1);

awk -v v=$min '{printf("%20.12f\n", $NF-min)}' energy.dat

