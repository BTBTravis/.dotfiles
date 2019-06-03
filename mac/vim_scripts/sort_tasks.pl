#!/usr/bin/perl
use strict;
use warnings;

my @done_tasks;
my @todo_tasks;
my $todo_type = "todo";
my $done_type = "done";
my $last_task_type = "none";

my $firstLine = <STDIN>;
my $indent = $firstLine =~ s/^(\s+).+/$1/rg;
$indent = length($indent);
$indent--;

while (<>) {
    if (/^\s{$indent}- \[X/) {
        push @done_tasks, $_;
        $last_task_type = $done_type;
    } elsif (/^\s{$indent}- \[/) {
        push @todo_tasks, $_;
        $last_task_type = $todo_type;
    } elsif ($last_task_type eq $todo_type && @todo_tasks > 0) {
        $todo_tasks[@todo_tasks - 1] = $todo_tasks[@todo_tasks - 1] . $_;
    } elsif ($last_task_type eq $done_type && @done_tasks > 0) {
        $done_tasks[@done_tasks - 1] = $done_tasks[@done_tasks - 1] . $_;
    }
}

foreach (@todo_tasks) {
    print;
}

foreach (@done_tasks) {
    print;
}
