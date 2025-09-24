#!/usr/bin/perl
use strict;
use warnings;

# Текст для поиска. Обратите внимание на использование кавычек q{}, чтобы избежать интерполяции.
my $text = q{Please contact us at support@example.com or sales@company.org for more information. You can also reach out to admin@test-site.net or user.name+tag@sub.domain.co.uk.};

# Регулярное выражение для поиска email
# [\w\.\-]+ : одна или более букв, цифр, подчёркиваний, точек или дефисов (локальная часть)
# @ : символ @
# [\w\-]+ : одна или более букв, цифр или дефисов (домен первого уровня)
# \. : символ точки (экранированный)
# [\w\-]+ : одна или более букв, цифр или дефисов (часть домена после точки)
# (\.[\w\-]+)* : ноль или более групп, состоящих из точки и домена (например, .com, .org)
# + : одна или более группа из точки и последующей части домена
my @emails = $text =~ /[\w\.\-]+@[\w\-]+(?:\.[\w\-]+)+/g;

print "Found emails:\n";
foreach my $email (@emails) {
    print " - $email\n";
}

# Сохраняем результат в файл со случайным именем
my $random_filename = "found_emails_" . int(rand(10000)) . ".txt";
open(my $fh, '>', $random_filename) or die "Could not open file '$random_filename' $!";
foreach my $email (@emails) {
    print $fh "$email\n";
}
close($fh);
print "\nEmails saved to '$random_filename'.\n";