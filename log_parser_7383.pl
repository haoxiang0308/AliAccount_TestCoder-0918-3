#!/usr/bin/perl
use strict;
use warnings;

# 日志解析和错误统计脚本
sub parse_log_and_count_errors {
    my ($log_file) = @_;
    
    # 检查日志文件是否存在
    unless (-e $log_file) {
        print "错误: 日志文件 '$log_file' 不存在\n";
        return;
    }
    
    # 打开日志文件
    open my $fh, '<', $log_file or die "无法打开日志文件 '$log_file': $!";
    
    my $error_count = 0;
    my $warning_count = 0;
    my $info_count = 0;
    my @error_lines = ();
    
    # 逐行读取日志文件
    while (my $line = <$fh>) {
        chomp $line;
        
        # 统计不同类型的日志条目
        if ($line =~ /ERROR|Error|error|FATAL|Fatal/) {
            $error_count++;
            push @error_lines, $line;
        } elsif ($line =~ /WARNING|Warning|warning/) {
            $warning_count++;
        } elsif ($line =~ /INFO|Info|info/) {
            $info_count++;
        }
    }
    
    close $fh;
    
    # 输出统计结果
    print "日志文件: $log_file\n";
    print "错误数量: $error_count\n";
    print "警告数量: $warning_count\n";
    print "信息数量: $info_count\n";
    print "\n错误详情:\n";
    
    for my $error_line (@error_lines) {
        print "$error_line\n";
    }
    
    return ($error_count, $warning_count, $info_count);
}

# 主程序
if (@ARGV < 1) {
    print "使用方法: $0 <log_file_path>\n";
    print "例如: $0 /path/to/your/logfile.log\n";
    exit 1;
}

my $log_file = $ARGV[0];
parse_log_and_count_errors($log_file);
