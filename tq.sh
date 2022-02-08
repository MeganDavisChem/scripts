#!/bin/bash
Es=$(find . -name energy.dat)
tz=$(echo "$Es\n" | grep tz/inp/)
qz=$(echo "$Es\n" | grep qz/inp/)
paste $tz $qz | awk \
'{printf"%20.12f\n",$1-(($2-$1)/(4.5**(-(4))-3.5**(-(4))))*3.5**(-(4))}' | awk \
'{print $NF}' > \
tq.dat

#CcCR part
dkr=$(echo "$Es\n" | grep dkr/inp/)
dk=$(echo "$Es\n" | grep dk/inp/)
mtc=$(echo "$Es\n" | grep mtc/inp/)
mt=$(echo "$Es\n" | grep mt/inp/)

paste tq.dat $mtc $mt $dkr $dk | \
awk '{printf"%20.12f\n", $1 + ($2-$3) + ($4-$5)}' | \
awk '{print $NF}' > tq_cccr.dat
