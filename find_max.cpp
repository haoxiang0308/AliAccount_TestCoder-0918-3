#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>

std::string generateRandomFileName() {
    const std::string charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, charset.size() - 1);
    
    std::string filename = "result_";
    for (int i = 0; i < 10; ++i) {
        filename += charset[dis(gen)];
    }
    filename += ".txt";
    
    return filename;
}

int main() {
    // Example array - you can modify this as needed
    std::vector<int> arr = {3, 7, 2, 9, 1, 8, 4, 6, 5};
    
    if (arr.empty()) {
        std::cout << "Array is empty!" << std::endl;
        return 1;
    }
    
    // Find the maximum element
    int max_element = *std::max_element(arr.begin(), arr.end());
    
    // Generate a random filename
    std::string filename = generateRandomFileName();
    
    // Save the maximum value to the file
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Maximum value in the array: " << max_element << std::endl;
        file.close();
        std::cout << "Maximum value " << max_element << " saved to file: " << filename << std::endl;
    } else {
        std::cout << "Could not open file for writing!" << std::endl;
        return 1;
    }
    
    return 0;
}