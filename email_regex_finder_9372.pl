#!/usr/bin/perl
use strict;
use warnings;

# Текст для поиска
my $text = 'Contact us at admin@example.com or support@domain.org for assistance. Also, bugs@dev-team.io is monitored.';

# Регулярное выражение для поиска email
# [\w\.\-] - символы для имя_учетной_записи (слово, точка, тире)
# @ - дословный символ @
# [\w\-]+ - доменное имя первого уровня
# (\.[\w\-]+)+ - одна или несколько групп точка.домен
# Весь паттерн не в скобках, чтобы захватить полный email
my @emails = $text =~ /[\w\.\-]+@[\w\-]+(?:\.[\w\-]+)+/g;

print "Found emails: @emails\n";

# Вывод каждого найденного email на отдельной строке
foreach my $email (@emails) {
    print "Email found: $email\n";
}