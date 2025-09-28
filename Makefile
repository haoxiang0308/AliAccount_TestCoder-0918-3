# Variables
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17
SRCDIR = src
OBJDIR = obj
BINDIR = bin

# Find all source files
SOURCES := $(wildcard $(SRCDIR)/*.cpp)
OBJECTS := $(SOURCES:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)
TARGET := $(BINDIR)/my_program

# Default target
.PHONY: all
all: $(TARGET)

# Link the executable
$(TARGET): $(OBJECTS) | $(BINDIR)
	$(CXX) $(OBJECTS) -o $@

# Compile the object files
$(OBJDIR)/%.o: $(SRCDIR)/%.cpp | $(OBJDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Create necessary directories
$(OBJDIR) $(BINDIR):
	mkdir -p $@

# Test target (example)
.PHONY: test
test:
	@echo "Running tests..."
	# Add your test commands here, e.g., ./bin/my_test_suite

# Clean target
.PHONY: clean
clean:
	rm -rf $(OBJDIR) $(BINDIR)

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  all    - Build the project (default)"
	@echo "  test   - Run tests"
	@echo "  clean  - Remove build artifacts"
	@echo "  help   - Show this help message"
