#!/usr/bin/perl

use warnings;
use strict;

my %occur;
for my $word (@ARGV) {
    # do something
    $occur{"$word"}++;
}

my $max = 0;
my $maxword;
for my $word (@ARGV) {
    if ($occur{"$word"} > $max) {
        $max = $occur{"$word"};
        $maxword = $word;
    }
}

print "$maxword\n"
