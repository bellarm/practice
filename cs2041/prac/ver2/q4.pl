#!/usr/bin/perl

use strict;
use warnings;

while (my $line = <>) {
    my @items = split(/ /,$line);
    foreach my $item (@items) {
        if ($item =~ /(\d+):(\d+):(\d+)/) {
            my $hh = $1;
            my $mm = $2;
            my $ss = $3;
            my $ampm;

            if ($hh > 12) {
                $hh = $hh - 12;
                $ampm = "pm";
                $hh = sprintf "%02d", $hh;
            } elsif ($hh < 12 && $hh > 0) {
                $ampm = "am"
            } elsif ($hh == 12) {
                $ampm = "pm";
            } elsif ($hh == 0) {
                $ampm = "am";
            }
            my $newtime = "$hh:$mm:$ss$ampm";
            $line =~ s/$item/$newtime/;
        }
    }
    print "$line";
}
