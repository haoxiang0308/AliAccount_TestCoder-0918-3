#!/usr/bin/perl
use strict;
use warnings;

# This script finds email addresses in a given text using a regular expression.

my $text = "Contact us at support\@example.com or sales\@company.org for more info. You can also reach john.doe+newsletter\@sub.domain.co.uk.";

my @emails = $text =~ /[\w\.\-]+\@[\w\.\-]+\.\w+/g;

print "Found emails:\n";
foreach my $email (@emails) {
    print " - $email\n";
}
