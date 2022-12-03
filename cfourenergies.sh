#!/bin/bash
for i in */; do (echo $i; cd $i; grep "The final electronic energy is" */*.dat > energy.dat; wc -l energy.dat); done
