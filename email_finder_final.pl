#!/usr/bin/perl
use strict;
use warnings;

# A sample text containing email addresses
my $text = "Please contact us at support\@example.com or sales\@company.org for more information. You can also reach john.doe+newsletter\@personal.net.";

# Use map to apply the regex to each potential match and capture the full email
# This ensures we get the entire match, not just sub-patterns.
my @emails = map { $& } $text =~ /[\w\.\-]+\@[\w\-]+(\.[\w\-]+)+(?!\w)/g;

print "Found emails: @emails\n";

# Write the found emails to a file with a random name
my $filename = "found_emails_final_" . int(rand(10000)) . ".txt";
open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
foreach my $email (@emails) {
    print $fh "$email\n";
}
close $fh;

print "Emails saved to file: $filename\n";