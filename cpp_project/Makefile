# Simple Makefile for C++ project

# Compiler and flags
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17
INCLUDES = -I./include

# Directories
SRCDIR = src
TESTDIR = tests
BUILDDIR = build

# Source files
SOURCES = $(SRCDIR)/main.cpp $(SRCDIR)/utils.cpp
TEST_SOURCES = $(TESTDIR)/test_main.cpp $(SRCDIR)/utils.cpp

# Object files
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(BUILDDIR)/%.o)
TEST_OBJECTS = $(BUILDDIR)/test_main.o $(BUILDDIR)/utils.o

# Executables
TARGET = $(BUILDDIR)/main
TEST_TARGET = $(BUILDDIR)/test_main

# Default target
all: build

# Build target - creates the main executable
build: $(BUILDDIR) $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $@
	@echo "Build completed: $(TARGET)"

# Test target - creates and runs tests
test: $(BUILDDIR) $(TEST_TARGET)
	@echo "Running tests..."
	./$(TEST_TARGET)

$(TEST_TARGET): $(TEST_OBJECTS)
	$(CXX) $(TEST_OBJECTS) -o $@
	@echo "Test executable created: $(TEST_TARGET)"

# Compile source files to object files
$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

$(BUILDDIR)/%.o: $(TESTDIR)/%.cpp
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Create build directory
$(BUILDDIR):
	mkdir -p $(BUILDDIR)

# Clean target - removes build artifacts
clean:
	rm -rf $(BUILDDIR)
	@echo "Clean completed"

# Phony targets
.PHONY: all build test clean