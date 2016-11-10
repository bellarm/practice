######################
# BASH NOTES
######################

-reading from stdin-
read var

-printing to stdout-
echo $var

-if statements-

if [ $x -lt $y ]
then
    # do something
elif [ $x -gt $y ]
then
    # do something again
else
    # do something else
fi

-comparison-

normal  number  string
==      -eq     =
!=      -ne     !=
>       -gt     > (use two [[, compare the ascii values)
<       -lt     <  ---------------""-------------------
>=      -ge
<=      -le
matches         ==
string is null  -z
not null        -n

-more than one condition-

OR
if [ cond1 ] || [ cond2 ]

AND
if [ cond1 ] && [ cond2 ]

-reading from stdin in shell script-

#1
while read line
do
    # do stuffs
done

#2
command < /dev/stdin

-tr-
if deleting:
tr -d "[char]"

if deleting multiple space:
tr -s " "


-cut-
if with tab
cut -d$'\t' -f1-

-sort-
-n -> sorting numerical
-r -> reversed

if use tab as delimiter for field
sort -k2 -t$'\t'


