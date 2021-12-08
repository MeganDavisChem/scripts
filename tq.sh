#!/bin/bash
Es=$(find . -name energy.dat)
tz=$(echo "$Es\n" | grep tz/inp/)
qz=$(echo "$Es\n" | grep qz/inp/)
paste $tz $qz | awk \
'{printf"%20.12f\n",$1-(($2-$1)/(4.5**(-(4))-3.5**(-(4))))*3.5**(-(4))}' | awk \
'{print $NF}' > \
tq.dat
