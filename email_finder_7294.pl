#!/usr/bin/perl
use strict;
use warnings;

# This script finds email addresses in a given string using a regular expression.

my $text = 'Contact us at support@example.com or sales@company.org for more information. Invalid: @.com, valid.also@sub.domain.co.uk';

# Regular expression for matching an email address
# It looks for:
# - One or more word characters, dots, hyphens, or underscores before the @
# - The @ symbol
# - One or more word characters, dots, or hyphens for the domain
# - A final dot followed by 2 or more word characters for the TLD
my $email_regex = qr/\b[\w\.\-]+@[\w\-]+(\.[\w\-]+)+\b/;

my @found_emails = $text =~ /($email_regex)/g;

print "Found emails:\n";
foreach my $email (@found_emails) {
    print "- $email\n";
}
