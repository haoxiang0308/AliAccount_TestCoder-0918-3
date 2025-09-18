#include <iostream>
#include <cassert>
#include "../include/calculator.h"

int main() {
    // Test addition
    assert(add(2, 3) == 5);
    assert(add(-1, 1) == 0);
    
    // Test subtraction
    assert(subtract(5, 3) == 2);
    assert(subtract(0, 5) == -5);
    
    // Test multiplication
    assert(multiply(3, 4) == 12);
    assert(multiply(-2, 3) == -6);
    
    // Test division
    assert(divide(10, 2) == 5.0);
    assert(divide(7, 2) == 3.5);
    
    std::cout << "All tests passed!" << std::endl;
    return 0;
}