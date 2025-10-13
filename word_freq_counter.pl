#!/usr/bin/perl
use strict;
use warnings;

# Check if a filename is provided
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

# Hash to store word frequencies
my %word_count;

# Open and read the file
open(my $fh, '<', $filename) or die "Could not open file '$filename': $!";

while (my $line = <$fh>) {
    chomp $line;
    # Convert to lowercase and split into words (removing punctuation)
    $line = lc($line);
    my @words = $line =~ /\b\w+\b/g;
    foreach my $word (@words) {
        $word_count{$word}++;
    }
}

close($fh);

# Print the word frequencies, sorted alphabetically
foreach my $word (sort keys %word_count) {
    print "$word: $word_count{$word}\n";
}