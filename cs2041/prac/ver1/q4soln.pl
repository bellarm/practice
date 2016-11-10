#!/bin/perl

use warnings;
use strict;

while (my $line = <>) {
    my @numbers = $line =~ /(\d+\.\d+)/g;
    foreach my $number (@numbers) {
        my $rounded_number = int($number + 0.5);
        $line =~ s/$number/$rounded_number/;
    }
    print $line;
}
