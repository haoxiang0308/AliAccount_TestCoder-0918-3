#!/usr/bin/perl
use strict;
use warnings;

# This script finds email addresses in a given text using regex
# and prints them out.

# Sample text to search for emails (you can replace this with reading from a file or input)
my $text = "Contact us at support@example.com or sales@company.org for more info. Invalid: @invalid.com";

# Regex pattern for matching emails
# This is a simplified pattern: word@word.domain
my $email_pattern = qr/\b[\w\.\-]+@[\w\-]+(\.[\w\-]+)+\b/;

# Find all matches
my @emails = $text =~ /$email_pattern/g;

print "Found emails:\n";
foreach my $email (@emails) {
    print "$email\n";
}