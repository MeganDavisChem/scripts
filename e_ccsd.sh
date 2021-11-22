#!/bin/bash

#Get minimum energy
#smart way!
min=$(grep "\!" *.out | grep "CCSD" | awk '{print $NF}' | sort | tail -1)

grep "\!" *.out | grep "CCSD" | awk -v v=$min '{printf("%20.12f\n", $NF-v)}' | awk '{print $NF}'

