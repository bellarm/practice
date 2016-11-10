#!/usr/bin/perl -w
while ($line = <STDIN>) {
    while ($line =~ s/<!([^>]+)>/<!>/g) {
        $s = `$1`;
        $line =~ s/<!>/$s/;
    }
    while ($line =~ s/<([^>]+)>/<>/g) {
        $s = `cat $1`;
        $line =~ s/<>/$s/;
    }
    print $line;
}
