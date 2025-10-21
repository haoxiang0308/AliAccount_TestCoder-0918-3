# Makefile for compilation and cleanup

# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -std=c99
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

# Cleanup target
clean:
	rm -f $(OBJECTS) $(TARGET)

# Clean all including backup files
cleanall: clean
	rm -f *~ *.bak *.tmp

# Phony targets
.PHONY: all clean cleanall