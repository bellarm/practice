#!/usr/bin/perl

use warnings;
use strict;

my %seen;
for my $word (@ARGV) {
    # do
    if (! defined $seen{"$word"}) {
        print "$word ";
        $seen{"$word"}++;
    }
}
