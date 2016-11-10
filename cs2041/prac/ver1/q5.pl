#!/usr/bin/perl

use warnings;
use strict;

my @lines;
my $i = 1;

while (my $line = <>) {
    $lines[$i++] = $line;
}

for ($i = 1; $i <= $#lines; $i++) {
    my $new;
    if ($lines[$i] =~ /^\#/) {
        $lines[$i] =~ /^\#(\d+)/;
        $new = $lines[$1];
    } else {
        $new = $lines[$i];
    }
    print "$new";
}
