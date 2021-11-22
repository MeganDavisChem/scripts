#!/bin/bash
echo "Make sure you run it in the freqs/geo/pts dir!"
echo "This version isn't agnostic to directory names!"
#cmin=$(cd pts; new.cccr | tail -1 | awk '{print $NF}')
search="EOM State"
cmin=$(cd pts/tz/inp; grep "$search" *.com.dat | awk '{print $NF}' | sort | tail -1);
anmin=$(cd freqs; grep -a "WHERE" anpass1.out | awk '{print $NF}')
zpt=$(cd freqs; summarize spectro2.out | head -1 | awk '{print $2}' | cut -d= -f2) 
echo "CC3 min: $cmin"
echo "Anpass min: $anmin"
echo "ZPT: $zpt"

echo "CccCR+Anpass+ZPT energy in cm-1"
echo "($cmin+$anmin)*219474.63+$zpt" | bc | xargs echo
