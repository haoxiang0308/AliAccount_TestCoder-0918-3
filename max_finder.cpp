#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>
#include <ctime>

int main() {
    // Example array - you can modify this as needed
    std::vector<int> arr = {3, 7, 2, 9, 1, 8, 5, 6, 4};
    
    if (arr.empty()) {
        std::cout << "Array is empty!" << std::endl;
        return 1;
    }
    
    // Find the maximum element
    int max_element = *std::max_element(arr.begin(), arr.end());
    std::cout << "Maximum element in the array: " << max_element << std::endl;
    
    // Generate a random filename
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(1000, 9999);
    
    std::string filename = "result_" + std::to_string(dis(gen)) + ".txt";
    
    // Write the maximum element to the file
    std::ofstream file(filename);
    if (file.is_open()) {
        file << max_element << std::endl;
        file.close();
        std::cout << "Maximum element saved to file: " << filename << std::endl;
    } else {
        std::cout << "Could not open file for writing!" << std::endl;
        return 1;
    }
    
    return 0;
}