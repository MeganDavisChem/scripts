#!/bin/bash

zz=$(grep "co   =" ?z/output.dat | tail -1 | awk '{print $NF}')
pcvtz=$(grep "co   =" pcvtz/output.dat | tail -1 | awk '{print $NF}')
pcvtz_nc=$(grep "co   =" pcvtz_nc/output.dat | tail -1 | awk '{print $NF}')

final=$(echo "$zz + $pcvtz - $pcvtz_nc" | bc -l)
echo $final

cp -r ?z final

sed -i "s/ 1\.[0-9].*/$final/" final/ZMAT
sed -i 's/co\*/co/' final/ZMAT
sed -i 's/CALC=.*/CALC=CCSD,BASIS=PVDZ/' final/ZMAT
sed -i 's/MEMORY_SIZE=.*/MEMORY_SIZE=2)/' final/ZMAT
sed -i 's/mem=.*/mem=2gb/' final/ZMAT.sh
(cd final; sbatch ZMAT.sh)
