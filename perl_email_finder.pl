use strict;
use warnings;

my $text = 'Please contact us at support@example.com or sales@company.org for more information. You can also reach john.doe+newsletter@sub.domain.co.uk';

my @emails = $text =~ /[\w\.\-]+@[\w\.\-]+\.[a-zA-Z]{2,}/g;

print "Found emails: @emails\n";

