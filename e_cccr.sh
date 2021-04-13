#!/bin/bash

#Get minimum energy
#smart way!


#Process:
#Get total energies for each method
#Compute CBS
#Compute DKr-Dk
#Compute MTc-MT
#Compute E_CcCR
#Sort and get minimum
#Get minimum energies
#do this in python lol

for i in */;
	do
	(
		min=$(grep "\!" *.out | grep "CCSD" | awk '{print $NF}' | sort | tail -1);


	);
awk -v v=$min '{printf("%20.12f\n", $NF-min)}' energy.dat

