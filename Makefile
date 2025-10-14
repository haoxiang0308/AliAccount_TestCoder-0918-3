# Makefile for a generic C++ project

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17

# Target executable name
TARGET = main

# Source files
SOURCES = main.cpp

# Object files
OBJECTS = $(SOURCES:.cpp=.o)

# Default target
all: $(TARGET)

# Link the executable
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)

# Compile source files into object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Build the project
.PHONY: build
build: $(TARGET)

# Test target (placeholder, customize as needed)
.PHONY: test
test:
	@echo "Running tests..."
	./$(TARGET) --run_tests

# Clean build artifacts
.PHONY: clean
clean:
	rm -f $(OBJECTS) $(TARGET)

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  build - Compile the project"
	@echo "  test  - Run tests (requires executable built with test support)"
	@echo "  clean - Remove object files and executable"
	@echo "  all   - Build the project (default)"
	@echo "  help  - Show this help message"