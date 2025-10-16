# Простой Makefile для компиляции программы на C
CC = gcc
CFLAGS = -Wall -g

# Предположим, что исходный файл называется program.c
program: program.c
	$(CC) $(CFLAGS) -o program program.c

clean:
	rm -f program

.PHONY: clean