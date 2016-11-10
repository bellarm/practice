#!/usr/bin/perl

use strict;
use warnings;

while (my $line = <>) {
    while ($line =~ s/<([^!].*?)>/<>/) {
        #print "\tsyntax is $1\n";
        my $tmp = `cat $1`;
        $line =~ s/<>/$tmp/;
        #print "\tline is $line\n";
    }
    while ($line =~ s/<!(.*?[^>])>/<>/) {
        #print "\tsyntax is $1\n";
        my $tmp = `$1`;
        $line =~ s/<>/$tmp/;
        #print "\tline is $line\nendofline\n";
    }
    print "$line";
}
