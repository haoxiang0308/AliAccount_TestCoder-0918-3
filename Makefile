# Makefile for C++ project

# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++17 -O2

# Directories
SRCDIR = src
OBJDIR = obj
BINDIR = bin
TESTDIR = test

# Source files (adjust these paths to match your project structure)
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)
TARGET = $(BINDIR)/main

# Test files
TEST_SOURCES = $(wildcard $(TESTDIR)/*.cpp)
TEST_TARGET = $(BINDIR)/test

# Default target
.PHONY: all
all: build

# Build target
.PHONY: build
build: $(TARGET)

$(TARGET): $(OBJECTS) | $(BINDIR)
	$(CXX) $(OBJECTS) -o $@

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp | $(OBJDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJDIR):
	mkdir -p $(OBJDIR)

$(BINDIR):
	mkdir -p $(BINDIR)

# Test target
.PHONY: test
test: $(TEST_TARGET)
	./$(TEST_TARGET)

$(TEST_TARGET): $(OBJECTS) $(TEST_SOURCES) | $(BINDIR)
	$(CXX) $(CXXFLAGS) $(OBJECTS) $(TEST_SOURCES) -o $@


# Clean target
.PHONY: clean
clean:
	rm -rf $(OBJDIR) $(BINDIR)

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  build  - Compile the project"
	@echo "  test   - Compile and run tests"
	@echo "  clean  - Remove generated files"
	@echo "  help   - Show this help message"