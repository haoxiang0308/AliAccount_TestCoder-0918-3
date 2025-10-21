# Makefile for C++ project

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17 -g

# Source directory
SRCDIR = src

# Build directory
BUILDDIR = build

# Test directory
TESTDIR = test

# Source files
SOURCES = $(wildcard $(SRCDIR)/*.cpp)

# Object files
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(BUILDDIR)/%.o)

# Executable name
TARGET = main

# Test executable name
TEST_TARGET = test_runner

# Default target
all: build

# Build target
build: $(TARGET)

# Link the executable
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)

# Compile source files
$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp
	@mkdir -p $(BUILDDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target
test: $(TEST_TARGET)
	./$(TEST_TARGET)

# Build and run tests
$(TEST_TARGET): $(OBJECTS) $(wildcard $(TESTDIR)/*.cpp)
	$(CXX) $(CXXFLAGS) $(OBJECTS) $(TESTDIR)/*.cpp -o $(TEST_TARGET)

# Clean target
clean:
	rm -rf $(BUILDDIR) $(TARGET) $(TEST_TARGET)

# Help target
help:
	@echo "Available targets:"
	@echo "  build - Compile the project"
	@echo "  test  - Build and run tests"
	@echo "  clean - Remove build artifacts"
	@echo "  all   - Build the project (default)"
	@echo "  help  - Show this help message"

.PHONY: all build test clean help