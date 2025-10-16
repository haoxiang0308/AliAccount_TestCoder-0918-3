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
TEST_TARGET = test

# Default target
.PHONY: all
all: build

# Build target
.PHONY: build
build: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)
	@echo "Build completed: $(TARGET)"

$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp
	@mkdir -p $(BUILDDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target
.PHONY: test
test: $(TEST_TARGET)
	./$(TEST_TARGET)

$(TEST_TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) $(OBJECTS) -o $(TEST_TARGET)
	@echo "Test build completed: $(TEST_TARGET)"

# Clean target
.PHONY: clean
clean:
	rm -rf $(BUILDDIR) $(TARGET) $(TEST_TARGET)
	@echo "Clean completed"

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  build - Compile the project"
	@echo "  test  - Build and run tests"
	@echo "  clean - Remove build artifacts"
	@echo "  all   - Build the project (default)"
	@echo "  help  - Show this help message"