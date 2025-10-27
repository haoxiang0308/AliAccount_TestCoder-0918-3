#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

# 函数：生成随机文件名
sub generate_random_filename {
    my $length = 8;
    my @chars = ('a'..'z', 'A'..'Z', '0'..'9');
    my $random_name = '';
    for (1..$length) {
        $random_name .= $chars[rand @chars];
    }
    return $random_name . '.pl';
}

# 主程序
sub main {
    print "Perl日志错误统计脚本\n";
    
    # 检查命令行参数
    if (@ARGV < 1) {
        print "用法: $0 <日志文件路径>\n";
        print "示例: $0 /path/to/logfile.log\n";
        exit 1;
    }
    
    my $log_file = $ARGV[0];
    
    # 检查日志文件是否存在
    unless (-e $log_file) {
        print "错误: 日志文件 '$log_file' 不存在\n";
        exit 1;
    }
    
    # 打开日志文件
    open(my $fh, '<', $log_file) or die "无法打开日志文件 '$log_file': $!";
    
    my $error_count = 0;
    my $warning_count = 0;
    my $critical_count = 0;
    my @error_lines = ();
    
    # 逐行读取日志文件
    while (my $line = <$fh>) {
        chomp $line;
        
        # 统计不同类型的错误
        if ($line =~ /error|ERROR|Error/i) {
            $error_count++;
            push @error_lines, $line;
        } elsif ($line =~ /warning|WARNING|Warning/i) {
            $warning_count++;
        } elsif ($line =~ /critical|CRITICAL|Critical/i) {
            $critical_count++;
        }
    }
    
    close($fh);
    
    # 输出统计结果
    print "日志文件: $log_file\n";
    print "错误数量: $error_count\n";
    print "警告数量: $warning_count\n";
    print "严重错误数量: $critical_count\n";
    
    # 生成随机命名的输出文件
    my $output_file = generate_random_filename();
    print "将结果保存到随机命名的文件: $output_file\n";
    
    # 将统计结果写入随机命名的Perl脚本文件
    open(my $out_fh, '>', $output_file) or die "无法创建输出文件 '$output_file': $!";
    
    print $out_fh "#!/usr/bin/perl\n";
    print $out_fh "use strict;\n";
    print $out_fh "use warnings;\n\n";
    
    print $out_fh "# 日志分析结果\n";
    print $out_fh "# 源日志文件: $log_file\n\n";
    
    print $out_fh "# 统计结果\n";
    print $out_fh "my \$error_count = $error_count;\n";
    print $out_fh "my \$warning_count = $warning_count;\n";
    print $out_fh "my \$critical_count = $critical_count;\n\n";
    
    print $out_fh "# 错误详情\n";
    print $out_fh "my \@errors = (\n";
    foreach my $error (@error_lines) {
        # 转义特殊字符
        $error =~ s/\\/\\\\/g;
        $error =~ s/"/\\"/g;
        print $out_fh "    \"$error\",\n";
    }
    print $out_fh ");\n\n";
    
    print $out_fh "# 输出统计结果\n";
    print $out_fh "print \"日志文件: $log_file\\n\";\n";
    print $out_fh "print \"错误数量: \$error_count\\n\";\n";
    print $out_fh "print \"警告数量: \$warning_count\\n\";\n";
    print $out_fh "print \"严重错误数量: \$critical_count\\n\";\n";
    print $out_fh "print \"总错误行数: \" . scalar(\@errors) . \"\\n\";\n";
    
    close($out_fh);
    
    print "统计结果已保存到: $output_file\n";
}

# 运行主程序
main();

# 如果直接执行此脚本，显示帮助信息
if (!caller) {
    main();
}