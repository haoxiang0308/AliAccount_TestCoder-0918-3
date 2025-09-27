# Sample Makefile for a C++ project
# This Makefile includes targets for building, testing, and cleaning the project.

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17

# Target executable name
TARGET = my_program

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

# Test target (example)
test:
	@echo "Running tests..."
	# Add your test commands here, for example:
	# ./run_tests

# Clean target
clean:
	rm -f $(OBJECTS) $(TARGET)

.PHONY: all test clean