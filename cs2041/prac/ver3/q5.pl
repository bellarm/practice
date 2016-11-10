#!/usr/bin/perl

use strict;
use warnings;

my %fines;
while(1) {
    print "Enter student name: ";
    my $name = <STDIN>;
    last if ! defined $name;
    chomp $name;
    print "Enter student fine: ";
    my $fine = <STDIN>;
    chomp $fine;

    $fines{$name} = 0 if !defined $fines{$name};
    $fines{$name} += $fine;
}

my $maxfine = 0;
my $expel;
foreach my $student (sort keys %fines) {
    if ($fines{$student} > $maxfine) {
        $maxfine = $fines{$student};
        $expel = $student;
    }
}

print "\nExpel $expel whose library fines total \$$maxfine\n";
