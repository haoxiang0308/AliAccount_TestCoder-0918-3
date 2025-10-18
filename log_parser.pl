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

# Function to count errors in log file
sub count_errors {
    my ($log_file) = @_;
    open(my $fh, '<', $log_file) or die "Cannot open log file '$log_file': $!";
    
    my $error_count = 0;
    my $warning_count = 0;
    my $critical_count = 0;
    
    while (my $line = <$fh>) {
        chomp $line;
        if ($line =~ /error/i) {
            $error_count++;
        }
        if ($line =~ /warning/i) {
            $warning_count++;
        }
        if ($line =~ /critical|fatal/i) {
            $critical_count++;
        }
    }
    
    close($fh);
    
    return ($error_count, $warning_count, $critical_count);
}

# Main script
print "Log File Parser\n";
print "==============\n";

# Get log file from command line argument or use default
my $log_file = $ARGV[0] || 'sample.log';

# Check if log file exists
unless (-e $log_file) {
    print "Log file '$log_file' not found. Creating a sample log file...\n";
    
    # Create a sample log file for demonstration
    open(my $fh, '>', $log_file) or die "Cannot create sample log file: $!";
    print $fh "2023-01-01 10:00:00 INFO Application started\n";
    print $fh "2023-01-01 10:01:00 ERROR Database connection failed\n";
    print $fh "2023-01-01 10:02:00 WARNING Low memory\n";
    print $fh "2023-01-01 10:03:00 ERROR File not found\n";
    print $fh "2023-01-01 10:04:00 INFO User login successful\n";
    print $fh "2023-01-01 10:05:00 CRITICAL System failure\n";
    print $fh "2023-01-01 10:06:00 ERROR Invalid input\n";
    print $fh "2023-01-01 10:07:00 WARNING Disk space low\n";
    close($fh);
    
    print "Sample log file '$log_file' created.\n";
}

# Count errors in the log file
my ($errors, $warnings, $criticals) = count_errors($log_file);

print "Statistics for log file: $log_file\n";
print "Errors found: $errors\n";
print "Warnings found: $warnings\n";
print "Critical issues found: $criticals\n";

# Generate a random filename for the output script
my $random_filename = generate_random_filename();
print "\nSaving results to random file: $random_filename\n";

# Write the results to the random file
open(my $out_fh, '>', $random_filename) or die "Cannot create output file '$random_filename': $!";

print $out_fh "#!/usr/bin/perl\n";
print $out_fh "# Generated script with log analysis results\n";
print $out_fh "# Log file analyzed: $log_file\n\n";
print $out_fh "my \$log_file = '$log_file';\n";
print $out_fh "my \$error_count = $errors;\n";
print $out_fh "my \$warning_count = $warnings;\n";
print $out_fh "my \$critical_count = $criticals;\n\n";
print $out_fh "print \"Log Analysis Results for: \$log_file\\n\";\n";
print $out_fh "print \"Errors: \$error_count\\n\";\n";
print $out_fh "print \"Warnings: \$warning_count\\n\";\n";
print $out_fh "print \"Critical Issues: \$critical_count\\n\";\n\n";
print $out_fh "# Total issues\n";
print $out_fh "my \$total_issues = \$error_count + \$warning_count + \$critical_count;\n";
print $out_fh "print \"Total Issues: \$total_issues\\n\";\n";

close($out_fh);

print "Results saved to $random_filename\n";
print "To run the generated script: perl $random_filename\n";