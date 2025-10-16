#!/usr/bin/perl
use strict;
use warnings;

# Check if a filename was provided
if (@ARGV != 1) {
    print "Usage: $0 <filename>\n";
    exit 1;
}

my $filename = $ARGV[0];

# Check if file exists
unless (-e $filename) {
    print "Error: File '$filename' does not exist.\n";
    exit 1;
}

# Open the file for reading
open(my $fh, '<', $filename) or die "Could not open file '$filename': $!";

# Hash to store word frequencies
my %word_count = ();

# Read the file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and extract words
    $line = lc($line);
    # Split the line into words (using non-word characters as delimiters)
    my @words = split(/\W+/, $line);
    
    # Count each word
    foreach my $word (@words) {
        # Skip empty strings
        next if $word eq '';
        $word_count{$word}++;
    }
}

# Close the file
close($fh);

# Print the word frequencies in descending order of frequency
print "Word frequencies in '$filename':\n";
print "-----------------------------\n";

# Sort by frequency (descending) and then alphabetically for ties
foreach my $word (sort { $word_count{$b} <=> $word_count{$a} || $a cmp $b } keys %word_count) {
    print "$word: $word_count{$word}\n";
}