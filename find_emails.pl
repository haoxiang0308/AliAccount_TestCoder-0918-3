#!/usr/bin/perl
use strict;
use warnings;

# This script searches for email addresses in a given text using a regular expression.

my $text = "Contact us at support\@example.com or sales\@company.org for more info. You can also reach john.doe+newsletter\@test.co.uk.";

# Regular expression to find emails:
# [\w\.\-]+ : Matches one or more word characters (letters, digits, underscore), dots, or hyphens for the local part.
# \@       : Matches the literal '@' symbol.
# [\w\.\-]+ : Matches one or more word characters, dots, or hyphens for the domain name.
# \.       : Matches the literal dot before the TLD.
# \w+      : Matches one or more word characters for the top-level domain.
my @emails = $text =~ /[\w\.\-]+\@[\w\.\-]+\.\w+/g;

print "Found emails: @emails\n";

# Optional: Print each email on a new line
foreach my $email (@emails) {
    print "  - $email\n";
}
