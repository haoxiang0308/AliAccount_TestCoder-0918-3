#!/usr/bin/perl
# Results from log parsing
# Log file: /workspace/sample.log

# Error statistics
my $error_count = 5;
my $warning_count = 2;
my $info_count = 3;

# Error lines found
my @error_lines = (
    "2023-01-01 10:01:00 ERROR Database connection failed",
    "2023-01-01 10:03:00 ERROR Failed to process request",
    "2023-01-01 10:05:00 ERROR Invalid input received",
    "2023-01-01 10:07:00 ERROR Timeout occurred",
    "2023-01-01 10:09:00 ERROR Connection lost",
);

# Print results
print "Error count: $error_count\n";
print "Warning count: $warning_count\n";
print "Info count: $info_count\n";
print "Total errors found: " . scalar(@error_lines) . "\n";

