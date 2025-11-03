#!/usr/bin/perl
use strict;
use warnings;

# 这是一个自动生成的Perl脚本，包含日志分析结果
# 生成时间: 
Mon Nov  3 14:57:57 2025

# 错误统计结果
my $error_count = 6;
my $log_file = '/workspace/sample.log';
my $pattern = 'error|Error|ERROR|failed|Failed|FAILED|exception|Exception|EXCEPTION|critical|Critical|CRITICAL';

# 错误详情
my @error_lines = (
    "2023-01-01 10:00:03 ERROR Database connection failed",
    "2023-01-01 10:00:05 ERROR Failed to connect to database",
    "2023-01-01 10:00:07 ERROR Exception occurred: NullPointerException",
    "2023-01-01 10:00:09 ERROR Authentication failed",
    "2023-01-01 10:00:10 CRITICAL System failure",
    "2023-01-01 10:00:12 ERROR Failed to process request",
);

print "日志文件: $log_file\n";
print "错误模式: $pattern\n";
print "错误总数: $error_count\n";
print "\n错误详情:\n";
for my $i (0..\$#error_lines) {
    print (($i+1) . ". " . $error_lines[$i] . "\n");
}
