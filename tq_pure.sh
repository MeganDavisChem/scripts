#!/bin/bash
lines=$(grep "DISP" intder.in | awk '{print $NF}')
low=$(find */  -name "energy.dat" -print | sort | xargs awk '{print $NF}' | pr -2 -l $lines -t -s\
	| awk '{printf "%20.12f\n", $2-(($1-$2)/(4.5**(-(4))-3.5**(-(4))))*3.5**(-(4))}' | sort | tail -n 1)

find */ -name "energy.dat" -print | sort | xargs awk '{print $NF}' | pr -2 -l $lines -t -s\
	| awk '{printf "%20.12f\n", $2-(($1-$2)/(4.5**(-(4))-3.5**(-(4))))*3.5**(-(4))}' \
	| awk -v var="$low" '{printf "%20.12f\n", $NF}'
