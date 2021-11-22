#!/bin/bash
grep "The final electronic energy is" */*.dat > energy.dat
min=$(awk '{print $(NF-1)}' energy.dat | sort | tail -1)
awk -v min=$min '{printf("%15.12f\n", $(NF-1)-min)}' energy.dat > relE.dat
