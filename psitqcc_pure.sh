#!/bin/bash
lines=$(grep "DISP" intder.in | awk '{print $NF}')
low=$(find */  -name "energy.dat" -print | sort | xargs awk '{print $NF}' | pr -4 -l $lines -t -s\
	| awk '{printf "%20.12f\n", $4-(($3-$4)/(4.5**(-(4))-3.5**(-(4))))*3.5**(-(4)) + $1-$2}' | sort | tail -n 1)

find */ -name "energy.dat" -print | sort | xargs awk '{print $NF}' | pr -4 -l $lines -t -s\
	| awk '{printf "%20.12f\n", $4-(($3-$4)/(4.5**(-(4))-3.5**(-(4))))*3.5**(-(4)) + $1-$2}' \
	| awk -v var="$low" '{printf "%20.12f\n", $NF}'
