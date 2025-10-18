#!/usr/bin/perl
use strict;
use warnings;

# Check if a filename is provided as an argument
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

# Hash to store word frequencies
my %word_count;

# Read the file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and split into words
    # This regex matches sequences of alphanumeric characters and apostrophes
    my @words = $line =~ /\b[\w']+\b/g;
    
    # Count each word
    foreach my $word (@words) {
        $word_count{$word}++;
    }
}

# Close the file
close($fh);

# Print the word frequencies, sorted by count in descending order
print "Word frequencies in '$filename':\n";
print "-" x 40 . "\n";

# Sort by frequency (descending) and then alphabetically for ties
foreach my $word (sort { $word_count{$b} <=> $word_count{$a} || $a cmp $b } keys %word_count) {
    printf "%-20s : %d\n", $word, $word_count{$word};
}