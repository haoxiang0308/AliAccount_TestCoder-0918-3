#!/usr/bin/perl
use strict;
use warnings;

# 从日志文件 '/workspace/test.log' 生成的错误统计结果

my %error_stats = (
    'CRITICAL' => 1,
    'FATAL' => 2,
    'ERROR' => 4,
);

print "错误统计结果:\n";
for my $error_type (keys %error_stats) {
    print "$error_type: $error_stats{$error_type}\n";
}
print "总错误数: 7\n";
