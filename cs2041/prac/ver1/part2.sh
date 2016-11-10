#!/bin/sh
#  Write a shell pipeline that given input in this format outputs the student numbers of all female students.
# The student numbers should be printed one per line and each student number should be printed once.
# Only the student numbers should be printed.

grep "F$" | cut -d'|' -f2 | sort | uniq
