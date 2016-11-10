#!/usr/bin/perl

use strict;
use warnings;

die("need more args") if ($#ARGV < 2);
open(F,"<$ARGV[0]");
my $start = $ARGV[1];
my $end = $ARGV[2];
die("diff length") if (length($start) != length($end));

my %connections;
# store as $connections{"$word1"}{"$word2"}

my @words;
while(my $line = <F>) {
    chomp $line;
    next if (length($line) != length($start));
    push @words, $line;
}

my %visited;
# store as a graph
foreach my $word1 (@words) {
    my @chars1 = split(//,$word1);
    foreach my $word2 (@words) {
        next if $visited{"$word2"};
        my @chars2 = split(//,$word2);
        my $diff = 0;
        for (my $i = 0; $i < length($start); $i++) {
            $diff++ if ($chars1[$i] ne $chars2[$i]);
        }
        next if ($diff != 1);
        $connections{"$word1"}{"$word2"} = 1;
        $connections{"$word2"}{"$word1"} = 1;
        last if ($word2 eq $end);
    }
    $visited{"$word1"} = 1;
}

# do a bfs to find a path
my %previous;
my %seen;
my @queue;
my $lastword;
my $found = 0;
push @queue, $start;
while ($#queue+1 != 0 or !$found) {
    my $curr = shift @queue;
    foreach my $word (keys %{$connections{"$curr"}}) {
        next if ($seen{"$word"});
        $previous{"$word"} = $curr;
        $seen{"$word"} = 1;
        push @queue, $word;
        if ($word eq $end) {
            $found = 1;
            $lastword = $word;
            last;
        }
    }
}

my @ladder;
while ($lastword ne $start) {
    unshift @ladder, $lastword;
    $lastword = $previous{"$lastword"};
}
unshift @ladder, $start;
print join("\n", @ladder);












