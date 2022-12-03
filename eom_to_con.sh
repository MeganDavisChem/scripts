#!/bin/bash
find . -name "pts" | xargs rm -r
find . -name "final" | xargs rm -r
for i in $(find . -name "ZMAT"); do (sed -i "/MEMORY/a \ \n\%excite\*\n1\n1\n1 5 0 6 0 1.0" $i; sed -i 's/EXCITE=.*/EXCITE=EOMEE/' $i; sed -i '/ESTATE_SYM.*/d' $i; sed -i 's/hoh =.*/hoh = 109.9/' $i; sed -i '/EXCITE/a CONTINUUM=VIRTUAL' $i); done
