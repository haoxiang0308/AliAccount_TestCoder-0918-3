# Makefile for C++ project

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++11 -Wall -Wextra -g
INCLUDES = -Iinclude

# Directories
SRCDIR = src
TESTDIR = tests
BUILDDIR = build
INCLUDEDIR = include

# Source files
SOURCES = $(SRCDIR)/main.cpp $(SRCDIR)/calculator.cpp
TEST_SOURCES = $(TESTDIR)/test_calculator.cpp $(SRCDIR)/calculator.cpp

# Object files
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(BUILDDIR)/%.o)
TEST_OBJECTS = $(TEST_SOURCES:$(SRCDIR)/%.cpp=$(BUILDDIR)/%.o)
TEST_OBJECTS := $(TEST_OBJECTS:$(TESTDIR)/%.cpp=$(BUILDDIR)/%.o)

# Executables
TARGET = $(BUILDDIR)/calculator
TEST_TARGET = $(BUILDDIR)/test_calculator

# Default target
all: build

# Build the main executable
build: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp
	@mkdir -p $(BUILDDIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Build and run tests
test: $(TEST_TARGET)
	./$(TEST_TARGET)

$(TEST_TARGET): $(TEST_OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

$(BUILDDIR)/%.o: $(TESTDIR)/%.cpp
	@mkdir -p $(BUILDDIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Clean build artifacts
clean:
	rm -rf $(BUILDDIR)

# Phony targets
.PHONY: all build test clean