#!/usr/bin/perl
use strict;
use warnings;

# This script finds email addresses in a given text using a regular expression.

my $sample_text = "Contact us at support\@example.com or sales\@another-domain.org for more information. You can also reach John at john.doe+newsletter\@sub.domain.co.uk.";

my @found_emails = $sample_text =~ /[\w\.\-]+\@[\w\.\-]+\.\w+/g;

print "Found emails:\n";
foreach my $email (@found_emails) {
    print " - $email\n";
}
