#!/usr/bin/perl
use strict;
use warnings;

# Sample text containing email addresses
my $text = "Contact us at support\@example.com or sales\@company.org for more info. You can also reach admin\@test.net";

# Use regex to find all email addresses
my @emails = $text =~ /[\w\.\-]+@[\w\-]+(?:\.[\w\-]+)/g;

print "Found emails: " . join(", ", @emails) . "\n";

# Save the found emails to a file
open(my $fh, '>', 'found_emails.txt') or die "Could not open file 'found_emails.txt' $!";
print $fh "Found emails: " . join(", ", @emails) . "\n";
close($fh);

print "Emails saved to found_emails.txt\n";