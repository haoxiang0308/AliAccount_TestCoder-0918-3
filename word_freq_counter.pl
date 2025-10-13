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
    # Convert to lowercase and split into words
    # Words are sequences of alphanumeric characters and apostrophes
    for my $word (split /\W+/, lc $line) {
        next if $word eq ''; # Skip empty strings
        $word_count{$word}++;
    }
}

# Close the file handle
close($fh);

# Print the word frequencies
print "Word frequencies in '$filename':\n";
for my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}