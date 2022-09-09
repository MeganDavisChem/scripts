#!/bin/bash

grep "EBASE(3)         =" *.out | awk '{print $(NF-1)}' > tz_energy.dat
grep "EBASE(2)         =" *.out | awk '{print $(NF-1)}' > qz_energy.dat
grep "EBASE(1)         =" *.out | awk '{print $(NF-1)}' > 5z_energy.dat
grep "MTC(1)           =" *.out | awk '{print $(NF-1)}' > mtc_energy.dat
grep "MT(1)            =" *.out | awk '{print $(NF-1)}' > mt_energy.dat
grep "DKR(1)           =" *.out | awk '{print $(NF-1)}' > dkr_energy.dat
grep "DK(1)            =" *.out | awk '{print $(NF-1)}' > dk_energy.dat
lines=$(wc -l tz_energy.dat | awk '{print $1}')
low=$(find .  -name "*energy.dat" -print | sort | xargs awk '{print $NF}' | pr -7 -l $lines -t -s\
	| awk '{printf "%20.12f\n", $7-(($6-$7)/(4.5**(-(4))-3.5**(-(4))))*3.5**(-(4))+(($1-$7+(($6-$7)/ (4.5**(-(4))-3.5**(-(4))))*(3.5**(-(4))-5.5**(-(4))))/ (0.7477488413*((3.5**(-(4))-5.5**(-(4))))-3.5**(-(6))+5.5**(-(6))))*((0.7477488413*(3.5**(-(4))))-3.5**(-(6))) + $4-$5 + $3-$2}' | sort | tail -n 1)

find . -name "*energy.dat" -print | sort | xargs awk '{print $NF}' | pr -7 -l $lines -t -s\
	| awk '{printf "%20.12f\n", $7-(($6-$7)/(4.5**(-(4))-3.5**(-(4))))*3.5**(-(4))+(($1-$7+(($6-$7)/ (4.5**(-(4))-3.5**(-(4))))*(3.5**(-(4))-5.5**(-(4))))/ (0.7477488413*((3.5**(-(4))-5.5**(-(4))))-3.5**(-(6))+5.5**(-(6))))*((0.7477488413*(3.5**(-(4))))-3.5**(-(6))) + $4-$5 + $3-$2}' \
	| awk -v var="$low" '{printf "%20.12f\n", $NF}'

#echo "Min energy is"
#echo "$low"
