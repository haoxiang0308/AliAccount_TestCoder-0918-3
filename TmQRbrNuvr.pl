#!/usr/bin/perl
use strict;
use warnings;

# Check if filename is provided as argument
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
        $word_count{$1}++;
    }
}

close($fh);

# Sort words by frequency (descending) and then alphabetically
my @sorted_words = sort {
    $word_count{$b} <=> $word_count{$a} || $a cmp $b
} keys %word_count;

# Print the word frequencies
print "Word frequencies in '$filename':\n";
print "-" x 40 . "\n";
foreach my $word (@sorted_words) {
    printf "%-20s : %d\n", $word, $word_count{$word};
}