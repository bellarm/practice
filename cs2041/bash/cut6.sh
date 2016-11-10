#!/bin/sh

while read line
do
    echo "$line" | cut -c13-
done

# if separated by tab use -d$'\t'
