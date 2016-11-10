#!/bin/sh

read line

printf "%.3f" $(echo "scale = 4; $line" | bc -l)

# printf to print 3 dp
# bc will evaluate arithmetic operations
# but it doesnt roundoff so put to 4 dp
