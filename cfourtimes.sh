#!/bin/bash
find . -name "output.dat" | xargs grep "This computation required" | awk '{time=time+$(NF-2)} END{print time/3600}' > hours.dat
cat hours.dat
