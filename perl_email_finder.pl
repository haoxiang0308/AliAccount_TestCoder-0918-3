#!/usr/bin/perl
use strict;
use warnings;

# This script finds email addresses in a given string using a regular expression.

my $text = 'Contact us at support@example.com or sales@company.org for more information. Invalid: @.com or valid.person@domain.co.uk';

# Regular expression for matching an email address
# It looks for:
# - One or more word characters, dots, hyphens, underscores, or plus signs before @
# - The @ symbol
# - One or more word characters or hyphens for the domain name
# - A literal dot
# - Two to four letters for the top-level domain
my $email_regex = qr/\b[\w\.\-+]+@[\w\-]+\.[a-zA-Z]{2,4}\b/;

# Find all matches
my @emails = $text =~ /$email_regex/g;

print "Found the following email addresses:\n";
foreach my $email (@emails) {
    print " - $email\n";
}