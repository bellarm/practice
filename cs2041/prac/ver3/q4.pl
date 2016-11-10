#!/usr/bin/perl

use strict;
use warnings;

while (my $line = <>) {
    my @items = split(/\|/, $line);
    foreach my $item (@items) {
        if ($item =~ /(.*), (.*)/) {
            my $name = "$2 $1";
            $line =~ s/$item/$name/;
        }
    }
    print "$line";
}
