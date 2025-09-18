# Makefile for C++ project

# Compiler and flags
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17 -g

# Directories
BUILDDIR = build
TARGET = $(BUILDDIR)/main
TEST_TARGET = $(BUILDDIR)/test

# Default target
all: build

# Build the main executable
build: $(TARGET)

$(TARGET):
	mkdir -p $(BUILDDIR)
	$(CXX) $(CXXFLAGS) main.cpp -o $@

# Build and run tests
test: run_test

run_test: $(TEST_TARGET)
	./$(TEST_TARGET)

$(TEST_TARGET):
	mkdir -p $(BUILDDIR)
	$(CXX) $(CXXFLAGS) test.cpp -o $@

# Clean build artifacts
clean:
	rm -rf $(BUILDDIR)

# Phony targets
.PHONY: all build test clean run_test