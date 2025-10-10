#!/usr/bin/perl
use strict;
use warnings;

# Check if a filename is provided
if (@ARGV != 1) {
    print "Usage: $0 <filename>\n";
    exit 1;
}

my $filename = $ARGV[0];

# Open the file for reading
open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";

my %word_count;

# Read the file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and split into words (handles punctuation)
    my @words = split(/\W+/, lc $line);
    foreach my $word (@words) {
        # Only count non-empty strings
        if ($word) {
            $word_count{$word}++;
        }
    }
}

# Close the file handle
close($fh);

# Print the word frequencies
foreach my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}