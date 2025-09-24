# Makefile for a simple C++ project

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

# Test executable name
TEST_TARGET = test_$(TARGET)

# Test source files
TEST_SOURCES = test_main.cpp test_utils.cpp

# Test object files
TEST_OBJECTS = $(TEST_SOURCES:.cpp=.o)

# Default target
all: $(TARGET)

# Build the main target
$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Build rule for object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Build the test target
test_build: $(OBJECTS) $(TEST_OBJECTS)
	$(CXX) $(CXXFLAGS) -o $(TEST_TARGET) $^

# Run tests (requires a test runner, here we just build and assume manual execution)
test: test_build
	@echo "Running tests..."
	./$(TEST_TARGET)

# Clean build artifacts
clean:
	rm -f $(OBJECTS) $(TEST_OBJECTS) $(TARGET) $(TEST_TARGET)

# Phony targets
.PHONY: all test_build test clean