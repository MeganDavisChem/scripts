#!/bin/bash

grep "\(   [1-9][0-9]\|    [1-9]\)\(   [1-9][0-9]\|    [1-9]\)    0    0" $1 |\
sort --field-separator=\  --key=1n 
grep "\(   [1-9][0-9]\|    [1-9]\)\(   [1-9][0-9]\|    [1-9]\)\(   [1-9][0-9]\|    [1-9]\)    0" $1 |\
sort --field-separator=\  --key=1n 
grep "\(   [1-9][0-9]\|    [1-9]\)\(   [1-9][0-9]\|    [1-9]\)\(   [1-9][0-9]\|    [1-9]\)\(   [1-9][0-9]\|    [1-9]\)" $1 |\
sort --field-separator=\  --key=1n 