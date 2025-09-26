# Define the C++ compiler
CXX = g++

# Define any compiler flags (e.g., -Wall for warnings, -g for debug info)
CXXFLAGS = -Wall -g

# Define the name of the executable
TARGET = my_program

# Define source files (e.g., all .cpp files in the current directory)
SOURCES = $(wildcard *.cpp)

# Define object files (one for each source file, replacing .cpp with .o)
OBJECTS = $(SOURCES:.cpp=.o)

# Default target: build the program
all: $(TARGET)

# Rule to link the executable from object files
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(TARGET)

# Rule to compile source files into object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Target to run tests (example: assumes a test executable named 'test_runner')
.PHONY: test
test:
	@echo "Running tests..."
	# Add your test command here, e.g., ./test_runner
	# For now, just print a message
	@echo "Tests completed (or would have been)."

# Target to clean up generated files
.PHONY: clean
clean:
	@echo "Cleaning build artifacts..."
	rm -f $(OBJECTS) $(TARGET)

# Help target to list available commands
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  all:    Build the project (default)."
	@echo "  test:   Run tests."
	@echo "  clean:  Remove build artifacts."
	@echo "  help:   Show this help message."