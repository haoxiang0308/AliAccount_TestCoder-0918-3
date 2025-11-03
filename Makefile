# Makefile for C++ project

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17 -g

# Target executable name
TARGET = main

# Source files
SOURCES = $(wildcard *.cpp)

# Object files
OBJECTS = $(SOURCES:.cpp=.o)

# Test target name
TEST_TARGET = test

# Build target
build: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target
test: build
	@echo "Running tests..."
	# Add your test commands here, for example:
	# ./$(TEST_TARGET) || echo "Tests failed"
	@echo "Tests completed"

# Clean target
clean:
	rm -f $(OBJECTS) $(TARGET)

# Phony targets
.PHONY: build test clean