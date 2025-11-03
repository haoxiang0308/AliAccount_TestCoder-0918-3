#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

# 生成随机文件名的函数
sub generate_random_filename {
    my $length = 8;
    my @chars = ('a'..'z', 'A'..'Z', '0'..'9');
    my $random_name = '';
    for (1..$length) {
        $random_name .= $chars[rand @chars];
    }
    return $random_name . '.pl';
}

# 检查命令行参数
if (@ARGV < 1) {
    print "用法: $0 <日志文件路径> [错误模式]\n";
    print "例如: $0 /path/to/logfile.txt\n";
    print "      $0 /path/to/logfile.txt 'ERROR'\n";
    exit 1;
}

my $logfile = $ARGV[0];
my $error_pattern = $ARGV[1] || 'error|Error|ERROR|failed|Failed|FAILED|exception|Exception|EXCEPTION|critical|Critical|CRITICAL';

# 检查日志文件是否存在
if (!-e $logfile) {
    print "错误: 日志文件 '$logfile' 不存在!\n";
    exit 1;
}

# 打开日志文件
open(my $fh, '<', $logfile) or die "无法打开文件 '$logfile': $!";

# 统计错误数量
my $error_count = 0;
my @error_lines = ();

while (my $line = <$fh>) {
    chomp $line;
    # 使用正则表达式匹配错误模式（不区分大小写）
    if ($line =~ /$error_pattern/i) {
        $error_count++;
        push @error_lines, $line;
    }
}

close($fh);

# 输出统计结果
print "日志文件: $logfile\n";
print "错误模式: $error_pattern\n";
print "错误总数: $error_count\n";
print "\n错误详情:\n";
print "=" x 50 . "\n";

for my $i (0..$#error_lines) {
    print (($i+1) . ". " . $error_lines[$i] . "\n");
}

# 生成随机命名的脚本文件
my $random_script_name = generate_random_filename();
print "\n生成的脚本文件名: $random_script_name\n";

# 创建包含统计结果的脚本
open(my $out_fh, '>', $random_script_name) or die "无法创建文件 '$random_script_name': $!";

print $out_fh <<'EOF';
#!/usr/bin/perl
use strict;
use warnings;

# 这是一个自动生成的Perl脚本，包含日志分析结果

EOF

print $out_fh "# 生成时间: " . localtime() . "\n\n";

print $out_fh "# 错误统计结果\n";
print $out_fh "my \$error_count = $error_count;\n";
print $out_fh "my \$log_file = '$logfile';\n";
print $out_fh "my \$pattern = '$error_pattern';\n";
print $out_fh "\n";
print $out_fh "# 错误详情\n";
print $out_fh "my \@error_lines = (\n";

for my $error_line (@error_lines) {
    # 转义引号和反斜杠
    $error_line =~ s/\\/\\\\/g;
    $error_line =~ s/"/\\"/g;
    print $out_fh "    \"$error_line\",\n";
}

print $out_fh ");\n\n";
print $out_fh "print \"日志文件: \$log_file\\n\";\n";
print $out_fh "print \"错误模式: \$pattern\\n\";\n";
print $out_fh "print \"错误总数: \$error_count\\n\";\n";
print $out_fh "print \"\\n错误详情:\\n\";\n";
print $out_fh "for my \$i (0..\$#error_lines) {\n";
print $out_fh "    print ((\$i+1) . \". \" . \$error_lines[\$i] . \"\\n\");\n";
print $out_fh "}\n";

close($out_fh);

print "脚本已保存到: $random_script_name\n";
print "可以使用 'perl $random_script_name' 运行生成的脚本查看结果\n";