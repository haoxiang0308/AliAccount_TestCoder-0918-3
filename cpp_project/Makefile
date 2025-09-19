# Makefile for C++ Project

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -g

# Target executable name
TARGET = max_finder
SOURCE = max_finder_616af26d65.cpp

# Default target
all: $(TARGET)

# Build target
$(TARGET): $(SOURCE)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(SOURCE)

# Test target
test: $(TARGET)
	./$(TARGET)

# Clean target
clean:
	rm -f $(TARGET)

# Phony targets
.PHONY: all test clean