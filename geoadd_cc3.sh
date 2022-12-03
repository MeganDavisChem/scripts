#!/bin/bash

zz=$(grep "co        =" ?z/opt.com.dat | tail -1 | awk '{print $NF}')
mtc=$(grep "co        =" mtc/opt.com.dat | tail -1 | awk '{print $NF}')
mt=$(grep "co        =" mt/opt.com.dat | tail -1 | awk '{print $NF}')

final=$(echo "$zz + $mtc - $mt" | bc -l)
echo $final

rm -r final
cp -r ?z final
rm final/opt.com.dat

#sed -i "s/co =.*/co = $final/" final/opt.com
sed -i "s/1\.[0-9].*/$final/" final/opt.com
#sed -i 's/co\*/co/' final/opt.com
sed -i 's/basis.*/basis cc-pvdz/' final/opt.com
sed -i "s/optimize.*/energy\(\'scf\'\)/" final/opt.com
sed -i 's/memory.*/memory 495 mb/' final/opt.com
sed -i 's/mem=.*/mem=2gb/' final/opt.sh
(cd final; sbatch opt.sh)
