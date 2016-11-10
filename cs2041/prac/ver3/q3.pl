#!/usr/bin/perl

use strict;
use warnings;
#print "$#ARGV";
die("need at least 2 arguments") if ($#ARGV < 1);
#my $filename = $ARGV[1] or die
open(F,"<$ARGV[0]") or die("you noob");

while (my $line = <F>) {
    $line =~ s/$ARGV[1]/\($ARGV[1]\)/g;
    print $line;
}

