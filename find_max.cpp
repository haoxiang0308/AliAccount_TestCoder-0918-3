#include <iostream>
#include <vector>
#include <algorithm>
#include <fstream>
#include <string>

int main() {
    // Example array
    std::vector<int> numbers = {3, 7, 2, 9, 1};

    // Find the maximum element
    if (numbers.empty()) {
        std::cout << "Array is empty." << std::endl;
        return 1;
    }

    int max_num = *std::max_element(numbers.begin(), numbers.end());

    // Generate a random filename
    std::string filename = "max_result_" + std::to_string(rand()) + ".txt";

    // Write the result to the file
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "The maximum number in the array is: " << max_num << std::endl;
        file.close();
        std::cout << "Result written to " << filename << std::endl;
    } else {
        std::cerr << "Could not open file for writing." << std::endl;
        return 1;
    }

    return 0;
}