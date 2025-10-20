#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

# Function to generate a random filename
sub generate_random_filename {
    my $length = 8;
    my @chars = ('a'..'z', 'A'..'Z', '0'..'9');
    my $random_string = '';
    for (1..$length) {
        $random_string .= $chars[rand @chars];
    }
    return $random_string . ".pl";
}

# Check if log file is provided as argument
if (@ARGV < 1) {
    print "Usage: $0 <log_file_path> [error_pattern]\n";
    print "Example: $0 /var/log/app.log\n";
    print "Default error pattern is 'ERROR', provide second argument to change it\n";
    exit 1;
}

my $log_file = $ARGV[0];
my $error_pattern = $ARGV[1] || "ERROR";

# Check if log file exists
unless (-e $log_file) {
    print "Error: Log file '$log_file' does not exist.\n";
    exit 1;
}

# Open and read the log file
open(my $fh, '<', $log_file) or die "Could not open file '$log_file': $!";

my $error_count = 0;
my @error_lines = ();

while (my $line = <$fh>) {
    chomp $line;
    if ($line =~ /$error_pattern/i) {
        $error_count++;
        push @error_lines, $line;
    }
}

close($fh);

# Print the results
print "Log file: $log_file\n";
print "Error pattern: '$error_pattern'\n";
print "Total errors found: $error_count\n";

if ($error_count > 0) {
    print "\nError lines:\n";
    for my $error_line (@error_lines) {
        print "$error_line\n";
    }
}

# Generate random filename for the saved script
my $random_filename = generate_random_filename();

# Write the script content to the random file
open(my $out_fh, '>', $random_filename) or die "Could not create file '$random_filename': $!";

print $out_fh <<'SCRIPT_CONTENT';
#!/usr/bin/perl
use strict;
use warnings;

# This is a generated script for parsing log files and counting errors

sub parse_log_file {
    my ($log_file, $error_pattern) = @_;
    $error_pattern ||= "ERROR";
    
    unless (-e $log_file) {
        print "Error: Log file '$log_file' does not exist.\n";
        return 0;
    }
    
    open(my $fh, '<', $log_file) or die "Could not open file '$log_file': $!";
    
    my $error_count = 0;
    while (my $line = <$fh>) {
        chomp $line;
        if ($line =~ /$error_pattern/i) {
            $error_count++;
        }
    }
    
    close($fh);
    return $error_count;
}

# Example usage (uncomment to use):
# my $count = parse_log_file("your_log_file.log", "ERROR");
# print "Total errors: $count\n";
SCRIPT_CONTENT

close($out_fh);

print "\nA Perl script has been saved to '$random_filename' with the basic functionality for log parsing.\n";
print "The script includes a function to parse log files and count errors.\n";