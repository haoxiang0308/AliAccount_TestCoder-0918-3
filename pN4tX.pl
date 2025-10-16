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
my %word_count = ();

# Read the file line by line
while (my $line = <$fh>) {
    # Convert to lowercase and split into words
    # This regex considers words as sequences of alphanumeric characters and apostrophes
    my @words = map { s/^[^a-zA-Z0-9']|[^a-zA-Z0-9']$//g; $_ } split /\s+/, lc($line);
    
    # Count each word
    foreach my $word (@words) {
        # Only count non-empty words
        if ($word ne '') {
            $word_count{$word}++;
        }
    }
}

close($fh);

# Print the word frequencies, sorted by frequency in descending order
print "Word frequencies in '$filename':\n";
print "--------------------------------\n";
foreach my $word (sort { $word_count{$b} <=> $word_count{$a} } keys %word_count) {
    printf "%-20s : %d\n", $word, $word_count{$word};
}