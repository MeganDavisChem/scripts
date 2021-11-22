#!/bin/bash
sed -n '/Current geometry/,/*/p' ../geo/5z/opt.out | sed '$d' | sed '$d' | sed '1,4d' > geom_5z.dat
sed -n '/Current geometry/,/*/p' ../geo/mtc/opt.out | sed '$d' | sed '$d' | sed '1,4d' > geom_mtc.dat
sed -n '/Current geometry/,/*/p' ../geo/mt/opt.out | sed '$d' | sed '$d' | sed '1,4d' > geom_mt.dat
paste geom_5z.dat geom_mtc.dat geom_mt.dat | awk '{printf " %19.12f%19.12f%19.12f\n", $2+$6-$10,$3+$7-$11,$4+$8-$12}' > geom.dat
a2b.sh
