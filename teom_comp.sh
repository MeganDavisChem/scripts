#!/bin/bash


#script for making energy.dat for h2o+ a1
#should work as a generic (t)+eom composite
#modify sed for different species
#uncommment line at bottom for non-composite methods
grep "Excitation energy / hartree" *.out > xs_all.dat
sed -n '/0\.0[7-9]/p' xs_all.dat > xs.dat
#sed -n '/0\.0[7-9]\|0\.10/p' xs_all.dat > xs.dat
#grep "EOM-CCSD right-hand side ground state energy / hartree" *.out > gs.dat
grep "CCSD(T) total energy / hartree" *.out > gs.dat
paste xs.dat gs.dat | awk '{printf("%15.12f\n",$7+$NF)}' > energy.dat
#min=$(awk '{print $NF}' energy.dat | sort | tail -1)
#awk -v min=$min '{printf("%15.12f\n", $NF-min)}' energy.dat > relE.d
