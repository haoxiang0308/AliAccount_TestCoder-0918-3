#!/usr/bin/perl
use strict;
use warnings;

# Regular expression for matching email addresses
my $email_regex = qr/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b/;

# Example text to search for emails
my $text = 'Contact us at support@example.com or sales@company.org for more info. Invalid: @invalid.com or test@.com';

# Find all email addresses in the text
my @emails = $text =~ /($email_regex)/g;

print "Found emails:\n";
foreach my $email (@emails) {
    print "$email\n";
}