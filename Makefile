# Makefile for C++ project
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17
SRCDIR = src
OBJDIR = obj
BINDIR = bin
SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(SOURCES:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)
TARGET = $(BINDIR)/main

# Default target
all: build

# Build target
build: $(TARGET)

$(TARGET): $(OBJECTS)
	@mkdir -p $(BINDIR)
	$(CXX) $(OBJECTS) -o $(TARGET)

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	@mkdir -p $(OBJDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Test target
test: build
	@echo "Running tests..."
	@if [ -f $(BINDIR)/main ]; then \
		./$(BINDIR)/main; \
	else \
		echo "No executable found. Run 'make build' first."; \
	fi

# Clean target
clean:
	@echo "Cleaning build artifacts..."
	@rm -rf $(OBJDIR) $(BINDIR)

# Phony targets
.PHONY: all build test clean