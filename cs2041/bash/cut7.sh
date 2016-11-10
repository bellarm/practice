#!/bin/sh

while read line
do
    echo "$line" | cut -d' ' -f4
done

# if separated by tab use -d$'\t'
