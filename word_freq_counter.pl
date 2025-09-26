#!/usr/bin/perl
use strict;
use warnings;

# Check for filename argument
my $filename = $ARGV[0] or die "Usage: $0 <filename>\n";

# Open the file for reading
open(my $fh, '<', $filename) or die "Could not open file '$filename': $!\n";

my %word_count;

# Read the file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and split into words
    # Words are defined as sequences of alphanumeric characters and apostrophes
    for my $word (split /\W+/, lc $line) {
        next if $word eq ''; # Skip empty strings
        $word_count{$word}++;
    }
}

# Close the file handle
close($fh);

# Print the results sorted alphabetically
for my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}