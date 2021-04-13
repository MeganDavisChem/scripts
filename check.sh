#!/bin/bash

disp=$(grep "DISP" intder.in | awk '{print $NF}')

for i in */;
do 
(
	cd $i/inp;
	grep "\!" *.out | grep "CCSD" > energy.dat;
	rm submitmissing;
	missingcheck.py $disp;
 	./submitmissing;
); 

done
