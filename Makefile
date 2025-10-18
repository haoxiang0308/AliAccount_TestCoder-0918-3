# Makefile for compilation and cleanup

# Compiler settings
CC = gcc
CFLAGS = -Wall -g
TARGET = program
SOURCES = $(wildcard *.c)
OBJECTS = $(SOURCES:.c=.o)

# Default target
all: $(TARGET)

# Compilation target
$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET)

# Object compilation
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean target
clean:
	rm -f $(OBJECTS) $(TARGET)

# Clean all including backups
clean-all: clean
	rm -f *~ *.bak *.tmp

.PHONY: all clean clean-all