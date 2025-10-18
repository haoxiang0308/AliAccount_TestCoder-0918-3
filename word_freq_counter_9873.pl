#!/usr/bin/perl
use strict;
use warnings;

# Check if a filename was provided as an argument
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
    # Convert to lowercase and extract words (sequences of alphanumeric characters and apostrophes)
    $line = lc($line);
    while ($line =~ /(\w+)/g) {
        my $word = $1;
        $word_count{$word}++;
    }
}

# Close the file
close($fh);

# Sort the words by frequency (in descending order)
my @sorted_words = sort { $word_count{$b} <=> $word_count{$a} } keys %word_count;

# Print the word frequencies
print "Word frequencies in '$filename':\n";
print "-" x 40 . "\n";
foreach my $word (@sorted_words) {
    printf "%-20s : %d\n", $word, $word_count{$word};
}