# Makefile for C++ project

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++11 -Wall -Wextra -g
INCLUDES = -I./include

# Directories
SRCDIR = src
INCLUDEDIR = include
TESTDIR = tests
BUILDDIR = build

# Source files
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(BUILDDIR)/%.o)

# Test files
TEST_SOURCES = $(wildcard $(TESTDIR)/*.cpp)
TEST_EXECUTABLES = $(TEST_SOURCES:$(TESTDIR)/%.cpp=$(BUILDDIR)/%)

# Main executable
TARGET = $(BUILDDIR)/main

# Default target
all: build

# Build the main executable
build: $(TARGET)

# Link the main executable
$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Compile source files
$(BUILDDIR)/%.o: $(SRCDIR)/%.cpp
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

# Run tests
test: $(TEST_EXECUTABLES)
	@for test_exec in $(TEST_EXECUTABLES); do \
		echo "Running $$test_exec..."; \
		./$$test_exec || exit 1; \
	done
	echo "All tests passed!"

# Compile test files
$(BUILDDIR)/%: $(TESTDIR)/%.cpp $(filter-out $(BUILDDIR)/main.o, $(OBJECTS))
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -o $@ $< $(filter-out $(BUILDDIR)/main.o, $(OBJECTS))

# Clean build artifacts
clean:
	rm -rf $(BUILDDIR)

# Phony targets
.PHONY: all build test clean