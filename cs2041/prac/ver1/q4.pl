#!/usr/bin/perl
# round numbers to nearest integer
use warnings;
use strict;

#my $file = <>;
#my @words = split(/ /, $file);
while (my $line = <>) {
    my @words = split(/ /, $line);
    for my $word (@words) {
        # check if the word contains number
        if($word =~ /^[^0]\d+\.\d+/) {
            #
            print "$word";
            $word =~ s/(.*\d+)\.(\d+)//g;
            my $dec = $2;
            my $int = $1;
            my $rounded;
            print "int is $1\n dec is $2\n";
            if ($dec >= 5) {
                $rounded = $int + 1;
            } else {
                $rounded = $int;
            }
            print "$word\n";
            print "before changing $word to $rounded\n";
            $line =~ s/$word/$rounded/;
        }
    }
    print "$line";
}
