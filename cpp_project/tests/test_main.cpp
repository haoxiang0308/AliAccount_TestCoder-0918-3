#include <iostream>

void testFunction() {
    std::cout << "Running tests..." << std::endl;
    // Simple test placeholder
    if (1 + 1 == 2) {
        std::cout << "Test passed!" << std::endl;
    } else {
        std::cout << "Test failed!" << std::endl;
    }
}

int main() {
    testFunction();
    return 0;
}