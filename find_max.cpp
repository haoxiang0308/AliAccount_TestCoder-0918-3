#include <iostream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>
#include <fstream>

int main() {
    // Example array
    std::vector<int> arr = {3, 7, 2, 9, 1};

    // Find the maximum element
    auto max_element_it = std::max_element(arr.begin(), arr.end());
    if (max_element_it != arr.end()) {
        int max_value = *max_element_it;
        std::cout << "Maximum value in the array is: " << max_value << std::endl;

        // Generate a random filename
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<> dis(10000, 99999);
        std::string filename = "result_" + std::to_string(dis(gen)) + ".txt";

        // Write the result to the file
        std::ofstream file(filename);
        if (file.is_open()) {
            file << max_value;
            file.close();
            std::cout << "Result saved to " << filename << std::endl;
        } else {
            std::cerr << "Could not open file for writing." << std::endl;
            return 1;
        }
    } else {
        std::cerr << "Array is empty." << std::endl;
        return 1;
    }

    return 0;
}