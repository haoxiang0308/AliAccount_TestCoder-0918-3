#!/usr/bin/perl
use strict;
use warnings;

# Скрипт для поиска email-адресов в введенном тексте

print "Введите текст для поиска email-адресов (Ctrl+D для завершения ввода):\n";

# Считываем весь ввод в одну строку
my $text = do { local $/; <STDIN> };

# Регулярное выражение для поиска email-адресов
# Это базовое выражение, реальные валидаторы могут быть сложнее
my @emails = ($text =~ /[\w\.-]+@[\w\.-]+\.\w+/g);

# Выводим найденные адреса
if (@emails) {
    print "Найденные email-адреса:\n";
    foreach my $email (@emails) {
        print "- $email\n";
    }
} else {
    print "Email-адреса не найдены.\n";
}