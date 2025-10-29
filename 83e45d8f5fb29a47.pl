#!/usr/bin/perl
use strict;
use warnings;

# Check if a filename is provided as an argument
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
    # Convert to lowercase and split into words
    # This regex matches sequences of word characters (letters, digits, underscore)
    my @words = map { s/^\W+|\W+$//gr } split /\s+/;  # Remove leading/trailing punctuation
    
    foreach my $word (@words) {
        # Convert to lowercase for case-insensitive counting
        $word = lc($word);
        
        # Only count words that have at least one alphabetic character
        if ($word =~ /[a-z]/i) {
            $word_count{$word}++;
        }
    }
}

close($fh);

# Print the word frequencies, sorted by count in descending order
print "Word frequencies in '$filename':\n";
print "-------------------------------\n";

for my $word (sort { $word_count{$b} <=> $word_count{$a} } keys %word_count) {
    printf "%-15s : %d\n", $word, $word_count{$word};
}