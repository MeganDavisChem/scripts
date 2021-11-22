#!/bin/bash
sed -n '/NEW CARTESIAN GEOMETRY (BOHR)/,$p' intder_geom.out | sed '1,2d' > temp.geo
sed -n '/GEOM/,/WEIGHT/p' spectro.tmp | sed '$d' | sed -n '3,$p' | awk '{print $1}' > temp.zs
paste temp.zs temp.geo > temp.spec
sed '/WEIGHT/,$d' spectro.tmp | head -5 | sed '$r'<(cat temp.spec) | sed '$r'<(sed -n '/WEIGHT/,$p' spectro.tmp) > spectro.in
gspectro spectro.in
