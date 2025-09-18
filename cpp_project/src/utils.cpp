#include "utils.h"
#include <iostream>

namespace utils {
    void print_message(const std::string& message) {
        std::cout << "Utils: " << message << std::endl;
    }
}