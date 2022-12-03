#!/bin/bash
lines=$(grep "DISP" intder.in | awk '{print $NF}')
low=$(find */  -name "energy.dat" -print | sort | xargs awk '{print $(NF-1)}' | pr -7 -l $lines -t -s\
	| awk '{printf "%20.12f\n", $5-(($4-$5)/(4.5**(-(4))-3.5**(-(4))))*3.5**(-(4)) + $2-$3 + $7-$6 + $1 - $5}' | sort | tail -n 1)

find */ -name "energy.dat" -print | sort | xargs awk '{print $(NF-1)}' | pr -7 -l $lines -t -s\
	| awk '{printf "%20.12f\n", $5-(($4-$5)/(4.5**(-(4))-3.5**(-(4))))*3.5**(-(4)) + $2-$3 + $7-$6 + $1 - $5}' \
	| awk -v var="$low" '{printf "%20.12f\n", $NF}'
