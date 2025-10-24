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

# Open and read the file
open(my $fh, '<', $filename) or die "Could not open file '$filename': $!";

my %word_count;

# Read file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and split into words
    # Using regex to match word characters (alphanumeric and underscore)
    my @words = $line =~ /\b\w+\b/g;
    
    # Count each word
    foreach my $word (@words) {
        $word_count{$lc $word}++;  # Convert to lowercase for case-insensitive counting
    }
}

close($fh);

# Sort words by frequency (in descending order)
my @sorted_words = sort { $word_count{$b} <=> $word_count{$a} } keys %word_count;

# Print the results
print "Word frequencies in '$filename':\n";
print "-" x 40 . "\n";
foreach my $word (@sorted_words) {
    printf "%-20s : %d\n", $word, $word_count{$word};
}