#!/usr/bin/perl
use strict;
use warnings;

my $statusCommandOutput = `git status -s`;
my @rawStatus = split("\n", $statusCommandOutput);

print "Select a file:\n";
my $i = 0;
foreach (@rawStatus) {
    my $status = $_;
    $status =~ s/^.{3}//g;
    print "$i: $status\n";
    $i++;
}

my $select = <STDIN>;
chomp $select;

my $j = 0;
foreach (@rawStatus) {
    if ($j eq $select) {
        my $status = $_;
        $status =~ s/^.{3}//g;
        #print "nvim $status";
        exec "nvim $status";
    }
    $j++;
}
