#!/usr/bin/perl
use strict;
use warnings;

# Check if filename provided as command line argument
if (@ARGV != 1) {
    die "Usage: $0 <filename>\n";
}

my $filename = $ARGV[0];

# Check if file exists
unless (-e $filename) {
    die "File '$filename' not found.\n";
}

# Open file for reading
open(my $fh, '<', $filename) or die "Cannot open file '$filename': $!\n";

# Hash to store word frequencies
my %word_count;

# Read file line by line
while (my $line = <$fh>) {
    # Convert to lowercase
    $line = lc($line);
    # Remove punctuation and split into words
    $line =~ s/[^\w\s]//g;
    my @words = split /\s+/, $line;
    
    # Count each word
    foreach my $word (@words) {
        # Skip empty strings
        next if $word eq '';
        $word_count{$word}++;
    }
}

# Close file
close($fh);

# Print word frequencies
print "Word Frequencies:\n";
print "----------------\n";
for my $word (sort keys %word_count) {
    printf "%-20s %d\n", $word, $word_count{$word};
}