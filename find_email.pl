#!/usr/bin/perl
use strict;
use warnings;

# Sample text containing emails
my $text = 'Contact us at support@example.com or sales@company.org for more info. Invalid: @invalid.com';

# Regular expression to match email addresses
my $email_regex = qr/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b/;

# Find all email addresses in the text
my @emails = $text =~ /($email_regex)/g;

print "Found emails:\n";
foreach my $email (@emails) {
    print "$email\n";
}