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

# Hash to store word frequencies
my %word_count = ();

# Open and read the file
open(my $fh, '<', $filename) or die "Could not open file '$filename': $!";

while (my $line = <$fh>) {
    # Convert to lowercase and extract words (alphanumeric characters and apostrophes within words)
    $line = lc($line);
    my @words = $line =~ /\b[\w']+\b/g;
    
    foreach my $word (@words) {
        $word_count{$word}++;
    }
}

close($fh);

# Print word frequencies sorted by count (descending)
print "Word frequencies in '$filename':\n";
print "-" x 40 . "\n";

# Sort by frequency (descending) then by word (ascending) for consistent output
for my $word (sort { $word_count{$b} <=> $word_count{$a} || $a cmp $b } keys %word_count) {
    printf "%-20s : %d\n", $word, $word_count{$word};
}