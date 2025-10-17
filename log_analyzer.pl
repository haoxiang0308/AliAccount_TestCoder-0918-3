#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

# 生成随机文件名
sub generate_random_filename {
    my $length = 8;
    my @chars = ('a'..'z', 'A'..'Z', '0'..'9');
    my $random_name = '';
    for (1..$length) {
        $random_name .= $chars[rand @chars];
    }
    return $random_name . '.pl';
}

# 解析日志并统计错误
sub parse_log_file {
    my ($log_file) = @_;
    
    # 检查日志文件是否存在
    unless (-e $log_file) {
        print "错误: 日志文件 '$log_file' 不存在!\n";
        return;
    }
    
    my %error_count = ();
    my $total_errors = 0;
    
    open(my $fh, '<', $log_file) or die "无法打开文件 '$log_file': $!";
    
    while (my $line = <$fh>) {
        chomp $line;
        
        # 查找包含错误的行（例如包含 "ERROR", "FATAL", "CRITICAL" 等关键词）
        if ($line =~ /(ERROR|FATAL|CRITICAL)/i) {
            $error_count{$1}++;
            $total_errors++;
        }
    }
    
    close($fh);
    
    # 显示统计结果
    print "日志文件: $log_file\n";
    print "总错误数: $total_errors\n";
    print "错误类型统计:\n";
    
    for my $error_type (keys %error_count) {
        print "  $error_type: $error_count{$error_type}\n";
    }
    
    # 生成新的脚本文件，包含统计结果
    my $random_filename = generate_random_filename();
    
    open(my $out_fh, '>', $random_filename) or die "无法创建文件 '$random_filename': $!";
    
    print $out_fh "#!/usr/bin/perl\n";
    print $out_fh "use strict;\n";
    print $out_fh "use warnings;\n\n";
    print $out_fh "# 从日志文件 '$log_file' 生成的错误统计结果\n\n";
    print $out_fh "my \%error_stats = (\n";
    
    for my $error_type (keys %error_count) {
        print $out_fh "    '$error_type' => $error_count{$error_type},\n";
    }
    
    print $out_fh ");\n\n";
    print $out_fh "print \"错误统计结果:\\n\";\n";
    print $out_fh "for my \$error_type (keys \%error_stats) {\n";
    print $out_fh "    print \"\$error_type: \$error_stats{\$error_type}\\n\";\n";
    print $out_fh "}\n";
    print $out_fh "print \"总错误数: $total_errors\\n\";\n";
    
    close($out_fh);
    
    print "\n脚本已保存到: $random_filename\n";
}

# 主程序
if (@ARGV < 1) {
    print "用法: $0 <日志文件路径>\n";
    print "示例: $0 /path/to/logfile.log\n";
    exit 1;
}

my $log_file = $ARGV[0];
parse_log_file($log_file);