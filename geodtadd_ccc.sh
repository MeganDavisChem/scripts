#!/bin/bash

zz=$(grep "co   =" [q,5]z/output.dat | tail -1 | awk '{print $NF}')
pcvtz=$(grep "co   =" pcvtz/output.dat | tail -1 | awk '{print $NF}')
pcvtz_nc=$(grep "co   =" pcvtz_nc/output.dat | tail -1 | awk '{print $NF}')
tz=$(grep "co   =" tz/output.dat | tail -1 | awk '{print $NF}')
tzt=$(grep "co   =" ccsdt/output.dat | tail -1 | awk '{print $NF}')

final=$(echo "$zz + $pcvtz - $pcvtz_nc + $tzt - $tz" | bc -l)
echo $final

cp -r [q,5]z final

sed -i "s/co =.*/co = $final/" final/ZMAT
sed -i 's/co\*/co/' final/ZMAT
sed -i 's/CALC=.*/CALC=CCSD,BASIS=PVDZ/' final/ZMAT
sed -i 's/MEMORY_SIZE=.*/MEMORY_SIZE=2)/' final/ZMAT
sed -i 's/mem=.*/mem=2gb/' final/ZMAT.sh
(cd final; sbatch ZMAT.sh)
