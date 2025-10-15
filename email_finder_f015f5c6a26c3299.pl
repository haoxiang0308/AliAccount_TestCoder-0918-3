#!/usr/bin/perl
use strict;
use warnings;

# Sample text containing email addresses
my $text = 'Please contact us at support@example.com or sales@company.org for more information. You can also reach john.doe@test-domain.co.uk';

# Regular expression to find email addresses
# Matches word characters, dots, hyphens before @
# Then word characters and hyphens for domain
# Followed by a dot and top-level domain
my @emails = $text =~ /[\w\.\-]+@[\w\-]+(\.[\w\-]+)/g;

# To capture the full email address, we need to modify the regex to not use capturing groups
# or to capture the entire email address
my @full_emails = $text =~ /[\w\.\-]+@[\w\-]+(?:\.[\w\-]+)+/g;

print "Found emails: @full_emails\n";

# Print each email on a separate line
foreach my $email (@full_emails) {
    print "$email\n";
}
