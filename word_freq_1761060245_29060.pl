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
my %word_freq = ();

# Read the file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and extract words
    $line = lc($line);
    my @words = $line =~ /\b\w+\b/g;
    
    # Count each word
    foreach my $word (@words) {
        $word_freq{$word}++;
    }
}

# Close the file
close($fh);

# Print the word frequencies, sorted by frequency (descending)
print "Word frequencies in '$filename':\n";
print "-------------------------------\n";

# Sort by frequency (descending) and then alphabetically for ties
foreach my $word (sort { $word_freq{$b} <=> $word_freq{$a} || $a cmp $b } keys %word_freq) {
    print "$word: $word_freq{$word}\n";
}