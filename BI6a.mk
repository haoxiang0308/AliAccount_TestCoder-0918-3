# Simple Makefile to compile a C program

# Compiler
CC = gcc

# Compiler flags
CFLAGS = -Wall -Wextra -std=c99

# Target executable
TARGET = hello

# Source file
SOURCE = hello.c

# Default target
all: $(TARGET)

# Rule to compile the C program
$(TARGET): $(SOURCE)
	$(CC) $(CFLAGS) -o $(TARGET) $(SOURCE)

# Clean up generated files
clean:
	rm -f $(TARGET)

.PHONY: all clean