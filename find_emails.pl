#!/usr/bin/perl
use strict;
use warnings;

# Sample text containing email addresses
my $text = "Please contact us at support\@example.com or sales\@shop.org for more information. You can also reach john.doe+newsletter\@company.co.uk.";

# Find all email addresses using a regex
# The regex /[\\w.\\-]+@[\\w\\-]+(\\.[\\w\\-]+)/g captures the full email
# but the parentheses only group the last part of the domain.
# To capture the full email, we should wrap the entire pattern in a non-capturing group or remove the grouping.
my @emails = $text =~ /[\w\.\-]+@[\w\-]+(\.[\w\-]+)/g;

print "Found partial matches (only domain extensions): @emails\n";

# Correct regex to capture the full email address
# The parentheses create a capture group, which returns only the captured part in list context.
# We need the full match, so we'll use a global match in a while loop or a different approach.
# Let's use a regex that doesn't rely on capture groups for the core match.
@emails = $text =~ /[\w\.\-]+@[\w\-]+(?:\.[\w\-]+)+/g;

print "Found full email addresses: @emails\n";

# Save the found emails to a file
my $output_file = "found_emails_" . int(rand(10000)) . ".txt";
open(my $fh, '>', $output_file) or die "Could not open file '$output_file' $!";
foreach my $email (@emails) {
    print $fh "$email\n";
}
close $fh;

print "Emails saved to $output_file\n";