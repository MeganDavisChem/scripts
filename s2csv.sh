#!/bin/bash
#summarize -tex -nohead spectro2.out | sed 's/\\\\//g' | sed 's/ & /,/g' | sed '/begin\|centering\|hline\|caption\|end/d' | sed '/ /d' | sed -r '/^\s*$/d'
summarize -tex -nohead spectro2.out | sed 's/\\\\//g' | sed 's/ & /,/g' | sed '/begin\|centering\|hline\|caption\|end/d' | sed '/ /d'
