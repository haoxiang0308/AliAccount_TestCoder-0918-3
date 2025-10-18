#!/usr/bin/perl
# Generated script with log analysis results
# Log file analyzed: sample.log

my $log_file = 'sample.log';
my $error_count = 3;
my $warning_count = 2;
my $critical_count = 1;

print "Log Analysis Results for: $log_file\n";
print "Errors: $error_count\n";
print "Warnings: $warning_count\n";
print "Critical Issues: $critical_count\n";

# Total issues
my $total_issues = $error_count + $warning_count + $critical_count;
print "Total Issues: $total_issues\n";
