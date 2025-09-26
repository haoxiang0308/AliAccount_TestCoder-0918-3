# Пример правила в Makefile для компиляции программы на C
# Предположим, исходный файл называется main.c

CC = gcc
CFLAGS = -Wall -g # Флаги для компилятора: предупреждения и отладочная информация

# Целевая программа
TARGET = my_program

# Исходные файлы
SOURCES = main.c

# Правило для сборки цели
$(TARGET): $(SOURCES)
	$(CC) $(CFLAGS) -o $(TARGET) $(SOURCES)

# Правило для очистки скомпилированного файла
clean:
	rm -f $(TARGET)

# Псевдоним для удобства
.PHONY: clean all
all: $(TARGET)