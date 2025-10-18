#!/usr/bin/perl
use strict;
use warnings;

# Sample text containing email addresses
my $text = "Contact us at support\@example.com or sales\@company.org for more info. You can also reach admin\@test.net";

# Regular expression to find email addresses
my @emails = $text =~ /[\w\.\-]+@[\w\.\-]+\.\w+/g;

# Print found email addresses
print "Found emails: @emails\n";

# Optionally, print each email on a new line
print "List of emails:\n";
foreach my $email (@emails) {
    print "$email\n";
}