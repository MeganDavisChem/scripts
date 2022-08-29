#!/bin/bash
sed -i '/roots_per/a \ DOCC = \[4\, 0\]\n\ SOCC = \[0\, 1\]' 003[2-9].com
sed -n '/003[2-9]/p' submit > submitnew
chmod +x submitnew
./submitnew
