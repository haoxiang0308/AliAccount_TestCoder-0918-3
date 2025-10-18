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
my %word_count;

# Read the file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and extract words (alphanumeric characters and apostrophes within words)
    $line = lc($line);
    while ($line =~ /(\w+(?:'\w+)?)/g) {
        my $word = $1;
        $word_count{$word}++;
    }
}

# Close the file handle
close($fh);

# Sort words by frequency (in descending order)
my @sorted_words = sort { $word_count{$b} <=> $word_count{$a} } keys %word_count;

print "Word frequencies in '$filename':\n";
print "-----------------------------\n";

foreach my $word (@sorted_words) {
    printf "%-15s : %d\n", $word, $word_count{$word};
}

print "\nTotal unique words: " . scalar(keys %word_count) . "\n";
print "Total words: " . (sum(values %word_count)) . "\n";

# Helper function to calculate sum
sub sum {
    my $total = 0;
    $total += $_ for @_;
    return $total;
}