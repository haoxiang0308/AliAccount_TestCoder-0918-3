#!/usr/bin/perl
use strict;
use warnings;

# A sample text containing email addresses
my $text = "Please contact us at support\@example.com or sales\@company.org for more information. You can also reach john.doe+newsletter\@personal.net.";

# Regular expression to find email addresses
# [\w\.\-]+ : Matches the username part (alphanumeric, dots, hyphens)
# \@       : Matches the literal '@' symbol
# [\w\-]+  : Matches the domain name part (alphanumeric, hyphens)
# (\.[\w\-]+)+ : Matches one or more groups of a dot followed by a domain part (like .com, .org.uk)
my @emails = $text =~ /[\w\.\-]+\@[\w\-]+(\.[\w\-]+)+/g;

print "Found emails: @emails\n";

# Write the found emails to a file with a random name
my $filename = "found_emails_" . int(rand(10000)) . ".txt";
open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
foreach my $email (@emails) {
    print $fh "$email\n";
}
close $fh;

print "Emails saved to file: $filename\n";