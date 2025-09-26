#!/usr/bin/perl
use strict;
use warnings;

# Регулярное выражение для поиска email
# Это базовое выражение для демонстрации
my $email_regex = qr/\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b/;

# Пример строки с email
my $text = "Контактная информация: john.doe\@example.com, jane_smith\@test.org и admin\@website.net";

# Поиск всех email в строке
my @emails = $text =~ /$email_regex/g;

print "Найденные email адреса:\n";
foreach my $email (@emails) {
    print "- $email\n";
}
