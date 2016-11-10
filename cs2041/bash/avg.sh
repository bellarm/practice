#!/bin/sh

read n
i=0
total=0
while [ $i -lt $n ]
do
    read x
    total=`expr $total + $x`
    i=`expr $i + 1`
done

printf "%.3f" $(echo "scale=4; $total / $n" | bc -l)
# need to be careful with rounding
