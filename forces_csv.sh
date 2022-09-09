#!/bin/bash
format2.sh fort.9903 > sorted_fort

header='\begin{longtable}{lrr}
\caption{Force constants in mdyne/\AA$^n$rad$^m$}
\\
\toprule'
middle=$(awk '{printf("F$_{%i %i %i %i}$,%18.12f\n",$1,$2,$3,$4,$5)}' sorted_fort)
footer='\bottomrule
\$^a$ $m$ and $n$ values depend upon the units of the coordinates
\end{longtable}'

#echo "$header"
echo "$middle"
#echo "$footer"
