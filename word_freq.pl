#!/usr/bin/perl
use strict;
use warnings;

# Check if a filename was provided
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
    # Convert to lowercase and extract words
    $line = lc($line);
    # Split the line into words (considering spaces, punctuation, etc.)
    my @words = $line =~ /\b\w+\b/g;
    
    # Count each word
    foreach my $word (@words) {
        $word_count{$word}++;
    }
}

# Close the file
close($fh);

# Print the word frequencies in descending order of frequency
print "Word frequencies in '$filename':\n";
foreach my $word (sort { $word_count{$b} <=> $word_count{$a} } keys %word_count) {
    print "$word: $word_count{$word}\n";
}