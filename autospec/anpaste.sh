#!/bin/bash
#Get anpass chunk in agnostic way
sed -n '/(/,/UNKNOWN/p' anpass.tmp | head -n -1 | tail -n +2 > anpass.mid

#Replace last column with relE.dat (I don't know how this actually works)
awk 'FNR==NR{a[NR]=$0;next} {sub($NF, a[FNR])}1' relE.dat anpass.mid > anpass.mid2

#Paste new chunk into old anpass
#hack fraud way to make this agnostic
#get end line of chunk (start should always be 9)
lines=$(wc -l anpass.mid | cut -d" " -f1)
end=$(echo "$lines+8" | bc)
sed 9,"$end"d anpass.tmp | sed '/(/r'<(cat anpass.mid2) > anpass1.in
rm anpass.mid anpass.mid2
~/../../home6/r2533/programs/anpass/anpass_cerebro.x < anpass1.in > anpass1.out

minline=$(grep -a -B 1 "0EI" anpass1.out | head -1)
sed "/END OF DATA/i STATIONARY POINT\n$minline" anpass1.in | sed '/!ST/d' > anpass2.in
~/../../home6/r2533/programs/anpass/anpass_cerebro.x < anpass2.in > anpass2.out
