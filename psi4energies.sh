#!/bin/bash
for i in */; do (cd $i; grep "EOM State" *.com.dat | awk '{print $NF " au"}' > energy.dat; wc -l energy.dat); done
