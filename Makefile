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

# Cleanup target
clean:
	rm -f $(OBJECTS) $(TARGET)

# Clean all including dependencies
clean-all: clean
	rm -f *.d

# Run the program
run: $(TARGET)
	./$(TARGET)

# Help target
help:
	@echo "Available targets:"
	@echo "  all      - Build the program (default)"
	@echo "  clean    - Remove object files and executable"
	@echo "  clean-all - Remove object files, executable and dependency files"
	@echo "  run      - Build and run the program"
	@echo "  help     - Show this help message"

.PHONY: all clean clean-all run help