#!/usr/bin/perl
use strict;
use warnings;

# 日志分析结果
# 源日志文件: /workspace/test.log

# 统计结果
my $error_count = 3;
my $warning_count = 2;
my $critical_count = 1;

# 错误详情
my @errors = (
    "2023-06-15 10:31:22 ERROR Database connection failed",
    "2023-06-15 10:33:05 ERROR Failed to process request",
    "2023-06-15 10:36:15 ERROR Unable to write to log file",
);

# 输出统计结果
print "日志文件: /workspace/test.log\n";
print "错误数量: $error_count\n";
print "警告数量: $warning_count\n";
print "严重错误数量: $critical_count\n";
print "总错误行数: " . scalar(@errors) . "\n";
