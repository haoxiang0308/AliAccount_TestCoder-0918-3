# Makefile for compilation and cleaning

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
cleanall: clean
	rm -f *~ *.bak *.tmp

# Help target
help:
	@echo "Available targets:"
	@echo "  all      : Build the program (default)"
	@echo "  clean    : Remove object files and executable"
	@echo "  cleanall : Remove all build artifacts and backups"
	@echo "  help     : Show this help message"