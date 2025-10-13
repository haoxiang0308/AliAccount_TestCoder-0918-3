# This is a simple Makefile to demonstrate compile and clean targets.
# It assumes a simple C project with a main.c file and an output executable named 'program'.

CC = gcc
CFLAGS = -Wall -g
TARGET = program
SOURCES = main.c
OBJECTS = $(SOURCES:.c=.o)

# Default target
all: $(TARGET)

# Link the executable
$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET)

# Compile source files into object files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up generated files
clean:
	rm -f $(OBJECTS) $(TARGET)

# Phony targets for convenience
.PHONY: all clean