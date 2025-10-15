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

# Function to parse log file and count errors
sub parse_log_file {
    my ($log_file) = @_;
    
    # Check if log file exists
    unless (-e $log_file) {
        die "Log file '$log_file' does not exist!\n";
    }
    
    # Open the log file for reading
    open(my $fh, '<', $log_file) or die "Cannot open log file '$log_file': $!\n";
    
    my $error_count = 0;
    my $warning_count = 0;
    my $info_count = 0;
    my @error_lines = ();
    
    # Read the file line by line
    while (my $line = <$fh>) {
        chomp $line;
        
        # Count different types of log entries
        if ($line =~ /ERROR|error|Error/) {
            $error_count++;
            push @error_lines, $line;
        } elsif ($line =~ /WARNING|warning|Warning/) {
            $warning_count++;
        } elsif ($line =~ /INFO|info|Info/) {
            $info_count++;
        }
    }
    
    close($fh);
    
    return ($error_count, $warning_count, $info_count, \@error_lines);
}

# Main script execution
print "Log File Parser\n";
print "==============\n";

# Get log file path from command line argument or use default
my $log_file = $ARGV[0] || '/workspace/sample.log';

# Parse the log file
my ($error_count, $warning_count, $info_count, $error_lines) = parse_log_file($log_file);

print "Parsed log file: $log_file\n";
print "Found $error_count error(s), $warning_count warning(s), and $info_count info message(s)\n";

# Generate random filename for output
my $output_file = generate_random_filename();
print "Saving results to: $output_file\n";

# Create output file with results
open(my $out_fh, '>', $output_file) or die "Cannot create output file '$output_file': $!\n";

# Write Perl script that contains the results
print $out_fh "#!/usr/bin/perl\n";
print $out_fh "# Results from log parsing\n";
print $out_fh "# Log file: $log_file\n";
print $out_fh "\n";
print $out_fh "# Error statistics\n";
print $out_fh "my \$error_count = $error_count;\n";
print $out_fh "my \$warning_count = $warning_count;\n";
print $out_fh "my \$info_count = $info_count;\n";
print $out_fh "\n";
print $out_fh "# Error lines found\n";
print $out_fh "my \@error_lines = (\n";
foreach my $line (@$error_lines) {
    # Escape quotes and backslashes for Perl string
    $line =~ s/\\/\\\\/g;
    $line =~ s/"/\\"/g;
    print $out_fh "    \"$line\",\n";
}
print $out_fh ");\n";
print $out_fh "\n";
print $out_fh "# Print results\n";
print $out_fh "print \"Error count: \$error_count\\n\";\n";
print $out_fh "print \"Warning count: \$warning_count\\n\";\n";
print $out_fh "print \"Info count: \$info_count\\n\";\n";
print $out_fh "print \"Total errors found: \" . scalar(\@error_lines) . \"\\n\";\n";
print $out_fh "\n";

close($out_fh);

print "Results saved to $output_file\n";

# Create a sample log file for testing if it doesn't exist
unless (-e $log_file) {
    print "Creating sample log file: $log_file\n";
    open(my $sample_fh, '>', $log_file) or die "Cannot create sample log file: $!\n";
    print $sample_fh "2023-01-01 10:00:00 INFO Application started\n";
    print $sample_fh "2023-01-01 10:01:00 ERROR Database connection failed\n";
    print $sample_fh "2023-01-01 10:02:00 WARNING Low disk space\n";
    print $sample_fh "2023-01-01 10:03:00 ERROR Failed to process request\n";
    print $sample_fh "2023-01-01 10:04:00 INFO User login successful\n";
    print $sample_fh "2023-01-01 10:05:00 ERROR Invalid input received\n";
    close($sample_fh);
}

print "\nTo run the generated script: perl $output_file\n";