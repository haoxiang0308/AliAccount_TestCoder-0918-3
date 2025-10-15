#!/usr/bin/perl
use strict;
use warnings;

# This script searches for email addresses in a given text using a regular expression.

my $text = "Please contact us at support\@example.com or sales\@company.org for more information. You can also reach john.doe\@test.net or admin\@site.co.uk.";

# Regular expression to match email addresses
my $email_regex = qr/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b/;

# Find all email addresses in the text
my @emails = $text =~ /($email_regex)/g;

# Print found emails
if (@emails) {
    print "Found emails:\n";
    foreach my $email (@emails) {
        print "- $email\n";
    }
} else {
    print "No emails found.\n";
}