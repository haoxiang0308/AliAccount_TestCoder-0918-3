# Makefile for compilation and cleaning

# Compiler settings
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

# Object file compilation
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean target
clean:
	rm -f $(OBJECTS) $(TARGET)

# Clean all including dependencies
clean-all: clean
	rm -f *.d

# Install target (example)
install: $(TARGET)
	@echo "Installing $(TARGET) to /usr/local/bin"
	cp $(TARGET) /usr/local/bin/

# Help target
help:
	@echo "Available targets:"
	@echo "  all       - Build the program (default)"
	@echo "  clean     - Remove object files and executable"
	@echo "  clean-all - Remove object files, executable and dependencies"
	@echo "  install   - Install the program to system"
	@echo "  help      - Show this help message"

.PHONY: all clean clean-all install help