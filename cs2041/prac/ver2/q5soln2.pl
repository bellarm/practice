#!/usr/bin/perl -w

while (<STDIN>) {
    s/<(!?)([^>]+)>/{$1 eq "!" ? `$2` : `cat $2`}/eg;
    print;
}
