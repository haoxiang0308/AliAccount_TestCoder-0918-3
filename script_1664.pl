#!/usr/bin/perl
use strict;
use warnings;

# Текст для поиска
my $text = "Contact us at support\@example.com or sales\@company.org for more info. Invalid: @.com";

# Регулярное выражение для поиска email
# [\w\.\-]+        : одна или более букв, цифр, подчеркиваний, точек или дефисов перед @
# @                : символ @
# [\w\-]+          : одна или более букв, цифр или дефисов после @
# (?:\.[\w\-]+)+   : одна или более незахватывающих групп, состоящих из точки и букв/цифр/дефисов (например, .com, .org, .co.uk)
my @emails = $text =~ /[\w\.\-]+@[\w\-]+(?:\.[\w\-]+)+/g;

print "Found emails: @emails\n";