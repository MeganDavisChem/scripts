#!/bin/bash
min=$(awk '{print $NF}' $1 | sort | tail -1)
awk -v min=$min '{printf("%15.12f\n", $NF-min)}' $1 > rel"$1"
