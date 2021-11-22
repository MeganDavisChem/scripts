#!/bin/bash
min=$(awk '{print $NF}' energy.dat | sort | tail -1)
awk -v min=$min '{printf("%15.12f\n", $NF-min)}' energy.dat > relE.dat

