#!/bin/bash
geo=$(sed -n '/NEW CARTESIAN GEOMETRY (BOHR)/,$p' intder_geom.out | sed '1,2d')
sed '/^    0$/,$d' intder.tmp | sed '$a\    0' | sed '$r'<(sed -n '/NEW CARTESIAN GEOMETRY (BOHR)/,$p' intder_geom.out | sed '1,2d') | sed '$r'<(sed -n '/H1\|O16\|AL\|C12\|MG/p' intder.tmp) | sed '$r'<(format.sh) > intder.in
/home/r410/programs/intder/Intder2005.x < intder.in > intder.out
cp file15 fort.15; cp file20 fort.30; cp file24 fort.40
