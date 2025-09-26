# Makefile for a sample C++ project

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17

# Target executable name
TARGET = main

# Source files
SOURCES = main.cpp utils.cpp

# Object files
OBJECTS = $(SOURCES:.cpp=.o)

# Default target
all: $(TARGET)

# Link object files to create the executable
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)

# Compile source files into object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Build the project
build: $(TARGET)
	@echo "Build complete."

# Test target (example)
test:
	@echo "Running tests..."
	# Add your test commands here, e.g., ./run_tests
	@echo "Tests finished."

# Clean build artifacts
clean:
	rm -f $(OBJECTS) $(TARGET)
	@echo "Clean complete."

.PHONY: all build test clean