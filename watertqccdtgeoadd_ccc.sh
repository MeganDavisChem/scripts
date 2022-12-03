#!/bin/bash
rm -r final

zz=$(grep "oh   =" qz/output.dat | tail -1 | awk '{print $NF}')
pcvtz=$(grep "oh   =" pcvtz/output.dat | tail -1 | awk '{print $NF}')
pcvtz_nc=$(grep "oh   =" pcvtz_nc/output.dat | tail -1 | awk '{print $NF}')
tz=$(grep "oh   =" tz/output.dat | tail -1 | awk '{print $NF}')
tzt=$(grep "oh   =" ccsdt/output.dat | tail -1 | awk '{print $NF}')

hohzz=$(grep "hoh  =" qz/output.dat | tail -1 | awk '{print $NF}')
hohpcvtz=$(grep "hoh  =" pcvtz/output.dat | tail -1 | awk '{print $NF}')
hohpcvtz_nc=$(grep "hoh  =" pcvtz_nc/output.dat | tail -1 | awk '{print $NF}')
hohtz=$(grep "hoh  =" tz/output.dat | tail -1 | awk '{print $NF}')
hohtzt=$(grep "hoh  =" ccsdt/output.dat | tail -1 | awk '{print $NF}')

final=$(echo "$zz + $pcvtz - $pcvtz_nc + $tzt - $tz" | bc -l)
hohfinal=$(echo "$hohzz + $hohpcvtz - $hohpcvtz_nc + $hohtzt - $hohtz" | bc -l)
echo $final
echo $hohfinal

cp -r qz final

sed -i "s/^oh\ .*/oh = $final/" final/ZMAT
sed -i 's/ oh\*/\ oh/' final/ZMAT
sed -i "s/hoh\ .*/hoh = $hohfinal/" final/ZMAT
sed -i 's/hoh\*/hoh/' final/ZMAT
sed -i 's/CALC=.*/CALC=CCSD,BASIS=PVDZ/' final/ZMAT
sed -i 's/MEMORY_SIZE=.*/MEMORY_SIZE=2)/' final/ZMAT
sed -i 's/mem=.*/mem=2gb/' final/ZMAT.sh
(cd final; sbatch ZMAT.sh)
