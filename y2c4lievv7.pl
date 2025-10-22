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

# Hash to store word frequencies
my %word_count;

# Open and read the file
open(my $fh, '<', $filename) or die "Could not open file '$filename': $!";

while (my $line = <$fh>) {
    chomp $line;
    # Convert to lowercase and extract words (alphanumeric characters and apostrophes within words)
    $line = lc($line);
    my @words = $line =~ /\b[\w']+\b/g;
    
    foreach my $word (@words) {
        $word_count{$word}++;
    }
}

close($fh);

# Sort words by frequency (in descending order)
my @sorted_words = sort { $word_count{$b} <=> $word_count{$a} } keys %word_count;

print "Word frequencies in '$filename':\n";
print "-----------------------------\n";

foreach my $word (@sorted_words) {
    print "$word: $word_count{$word}\n";
}