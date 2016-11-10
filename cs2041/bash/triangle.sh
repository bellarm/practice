#!/bin/sh
# passed!
read x
read y
read z

if [ $x -eq $y ] && [ $y -eq $z ]
then
    echo "EQUILATERAL"
elif [ $x -eq $y ] && [ $x -ne $z ]
then
    echo "ISOSCELES"
elif [ $x -eq $z ] && [ $x -ne $y ]
then
    echo "ISOSCELES"
else
    echo "SCALENE"
fi
