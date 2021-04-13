#!/bin/bash
alias summarize="/ddn/home1/r2518/Programs/summarize/summarize"
echo "Make sure you run it in the freqs/geo/pts dir!"
cmin=$(cd pts; new.cccr | tail -1 | awk '{print $NF}')
anmin=$(cd freqs; grep -a "WHERE" anpass1.out | awk '{print $NF}')
zpt=$(cd freqs; /ddn/home1/r2518/Programs/summarize/summarize spectro2.out | head -1 | awk '{print $2}' | cut -d= -f2) 
echo "CcCR min: $cmin"
echo "Anpass min: $anmin"
echo "ZPT: $zpt"

echo "CccCR+Anpass+ZPT energy in cm-1"
echo "($cmin+$anmin)*219474.63+$zpt" | bc | xargs echo
