#!/usr/bin/perl
use strict;
use warnings;

# Check if a filename is provided
if (@ARGV != 1) {
    print "Usage: $0 <filename>\n";
    exit 1;
}

my $filename = $ARGV[0];

# Check if the file exists
unless (-e $filename) {
    print "Error: File '$filename' does not exist.\n";
    exit 1;
}

# Open the file for reading
open(my $fh, '<', $filename) or die "Could not open file '$filename': $!";

my %word_count;

while (my $line = <$fh>) {
    chomp $line;
    # Convert to lowercase and split into words (handles punctuation)
    my @words = split /\W+/, lc $line;
    for my $word (@words) {
        # Skip empty strings that might result from split
        if ($word) {
            $word_count{$word}++;
        }
    }
}

close $fh;

# Print the results
print "Word frequencies in '$filename':\n";
for my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}