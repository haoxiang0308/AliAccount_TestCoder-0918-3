#!/usr/bin/perl
use strict;
use warnings;

# This is a generated script for parsing log files and counting errors

sub parse_log_file {
    my ($log_file, $error_pattern) = @_;
    $error_pattern ||= "ERROR";
    
    unless (-e $log_file) {
        print "Error: Log file '$log_file' does not exist.\n";
        return 0;
    }
    
    open(my $fh, '<', $log_file) or die "Could not open file '$log_file': $!";
    
    my $error_count = 0;
    while (my $line = <$fh>) {
        chomp $line;
        if ($line =~ /$error_pattern/i) {
            $error_count++;
        }
    }
    
    close($fh);
    return $error_count;
}

# Example usage (uncomment to use):
# my $count = parse_log_file("your_log_file.log", "ERROR");
# print "Total errors: $count\n";
