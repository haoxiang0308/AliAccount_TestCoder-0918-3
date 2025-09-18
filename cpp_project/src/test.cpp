#include <iostream>
#include "utils.h"

int main() {
    std::cout << "Running tests..." << std::endl;
    utils::printMessage("Test message");
    std::cout << "All tests passed!" << std::endl;
    return 0;
}