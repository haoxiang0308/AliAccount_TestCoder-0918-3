#include "utils.h"
#include <iostream>

namespace utils {
    void printMessage(const std::string& message) {
        std::cout << "Utils: " << message << std::endl;
    }
}