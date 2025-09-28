#!/usr/bin/perl
use strict;
use warnings;

# Регулярное выражение для поиска email
# Этот паттерн простой и не охватывает все возможные случаи RFC, но подходит для базового поиска
my $email_regex = qr/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b/;

# Пример строки с email
my $text = "Контактная информация: john.doe\@example.com, support\@mysite.org, или посетите наш сайт.";

# Поиск и вывод найденных email
while ($text =~ /($email_regex)/g) {
    print "Найден email: $1\n";
}

# Сохранение найденных email в файл со случайным именем
my @found_emails = $text =~ /$email_regex/g;

# Генерация случайного имени файла
my $random_filename = "emails_found_" . int(rand(10000)) . ".txt";

open(my $fh, '>', $random_filename) or die "Не могу открыть файл '$random_filename' для записи: $!";
foreach my $email (@found_emails) {
    print $fh "$email\n";
}
close($fh);

print "Найденные email адреса сохранены в файл '$random_filename'.\n"