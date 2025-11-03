#!/usr/bin/perl
use strict;
use warnings;
use List::Util qw(shuffle);

# Create an array with some initial values
my @array = (1..10);

print "Original array: " . join(", ", @array) . "\n";

# Manipulate the array in various ways
push @array, 11;                    # Add element to end
unshift @array, 0;                  # Add element to beginning
pop @array;                         # Remove last element
shift @array;                       # Remove first element

print "After basic manipulations: " . join(", ", @array) . "\n";

# Reverse the array
@array = reverse @array;
print "Reversed: " . join(", ", @array) . "\n";

# Sort the array
@array = sort { $a <=> $b } @array;
print "Sorted: " . join(", ", @array) . "\n";

# Shuffle the array
@array = shuffle(@array);
print "Shuffled: " . join(", ", @array) . "\n";

# Get a random name for the output file
my @chars = ('a'..'z', 'A'..'Z', '0'..'9');
my $random_name = join('', map { $chars[rand @chars] } 1..10) . '.txt';

# Write the final array to the file
open my $fh, '>', $random_name or die "Could not open file '$random_name': $!";
print $fh "Final array: " . join(", ", @array) . "\n";
close $fh;

print "Array saved to file: $random_name\n";