#!/bin/bash
#cp ../pts/intder.in intder_geom.tmp
#sed -n '/WHERE/,/0EI/p' anpass1.out | head -n -2 | tail -n +2 | awk '{printf("%5d %18.10f\n", NR, $NF)}'

sed '/DISP/,$d' intder_geom.tmp | sed '$a DISP   1' | sed '$r'<(sed -n '/WHERE/,/0EI/p' anpass1.out | head -n -2 | tail -n +2 | awk '{printf("%5d %18.10f\n", NR, $NF)}') | sed '$a\    0' > intder_geom.in

#rm intder_geom.tmp

~/../../home6/r2533/programs/intder/Intder2005.x < intder_geom.in > intder_geom.out
