#!/usr/bin/perl
use strict;
use warnings;

# This script finds email addresses in a given string using a regular expression.

my $text = "Contact us at support@example.com or sales@company.org for more info. Invalid: @.com or user@.com.";

# Regular expression to match a basic email pattern
# - \w+ matches one or more word characters (letters, digits, underscore) for the local part
# - [.\w-]+ matches one or more dots, word characters, or hyphens for the domain part
# - \. matches a literal dot
# - \w{2,} matches two or more word characters for the top-level domain
my $email_regex = qr/\b(\w+[.\w-]*\@\w+[.\w-]*\.\w{2,})\b/;

my @found_emails = $text =~ /$email_regex/g;

print "Found emails:\n";
foreach my $email (@found_emails) {
    print "- $email\n";
}
