# This is a sample Makefile with 'build' and 'clean' targets.

# Define the target executable name
TARGET = my_program

# Define the source files
SOURCES = main.c utils.c

# Define the object files
OBJECTS = $(SOURCES:.c=.o)

# Define the compiler
CC = gcc

# Define the compiler flags
CFLAGS = -Wall -g

# Default target
all: $(TARGET)

# Link the object files to create the executable
$(TARGET): $(OBJECTS)
	$(CC) -o $(TARGET) $(OBJECTS)

# Compile the source files into object files
$(OBJECTS): %.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean the generated files
clean:
	rm -f $(OBJECTS) $(TARGET)

# Phony targets
.PHONY: all clean