#!/usr/bin/perl
use strict;
use warnings;

my $log_file = q{/workspace/error.log};
my $error_count = 0;

open(my $fh, q{<}, $log_file) or die qq{Cannot open $log_file: $!\n};

while (my $line = <$fh>) {
    chomp $line;
    if ($line =~ /ERROR/) {
        $error_count++;
    }
}

close($fh);

print qq{Total errors found in $log_file: $error_count\n};
