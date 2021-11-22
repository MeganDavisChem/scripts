#!/bin/bash


#converts energy.dat to relE.dat
#grep "Excitation energy / hartree" *.out > xs_all.dat
#sed -n '/0\.0003/p' xs_all.dat > xs.dat
#grep "EOM-CCSD right-hand side ground state energy / hartree" *.out > gs.dat
#paste xs.dat gs.dat | awk '{printf("%15.12f\n",$7+$NF)}' > energy.dat
min=$(awk '{print $NF}' energy.dat | sort | tail -1)
awk -v min=$min '{printf("%15.12f\n", $NF-min)}' energy.dat > relE.dat
