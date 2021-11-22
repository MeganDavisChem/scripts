#!/bin/bash
echo "Running anpass"
anpaste_eland.sh
echo "Running intder_geom"
intgeom_eland.sh
echo "Running intder"
intharm_eland.sh
echo "Running spectro"
spectpaste_eland.sh
summarize spectro2.out
