# Makefile for C++ project

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17

# Target executable name
TARGET = main

# Source files
SOURCES = $(wildcard *.cpp)
# Exclude test files from main sources
MAIN_SOURCES = $(filter-out $(TEST_SOURCES),$(SOURCES))

# Object files
OBJECTS = $(MAIN_SOURCES:.cpp=.o)

# Test executable name
TEST_TARGET = run_tests

# Test source files
TEST_SOURCES = $(wildcard test_*.cpp)

# Test object files
TEST_OBJECTS = $(TEST_SOURCES:.cpp=.o)

# Build target
build: $(TARGET)

# Link object files to create the executable
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)

# Compile source files to object files
$(OBJECTS): %.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Compile test files to object files
$(TEST_OBJECTS): %.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Build test target
test_build: $(TEST_TARGET)

# Link test object files to create the test executable
$(TEST_TARGET): $(OBJECTS) $(TEST_OBJECTS)
	$(CXX) $(OBJECTS) $(TEST_OBJECTS) -o $(TEST_TARGET)

# Run tests
test: test_build
	./$(TEST_TARGET)

# Clean build artifacts
clean:
	rm -f $(OBJECTS) $(TEST_OBJECTS) $(TARGET) $(TEST_TARGET)

# Phony targets
.PHONY: build test_build test clean