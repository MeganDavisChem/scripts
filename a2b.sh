#!/bin/bash
#Convert Cart geo from angstrom to bohr. Should work for standard .xyz?
bohr=1.8897259886
cat geom.dat | awk -v bohr=$bohr '{printf " %19.12f%19.12f%19.12f\n", $2*bohr, $3*bohr, $4*bohr}'

