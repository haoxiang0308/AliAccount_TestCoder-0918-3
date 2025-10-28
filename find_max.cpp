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
    
    std::string filename = "";
    int length = 10; // Length of random filename
    
    for (int i = 0; i < length; ++i) {
        filename += charset[dis(gen)];
    }
    
    filename += ".txt"; // Add extension
    return filename;
}

int main() {
    // Example array - in a real scenario this could be user input or from a file
    std::vector<int> arr = {3, 7, 2, 9, 1, 8, 4, 6, 5};
    
    if (arr.empty()) {
        std::cout << "Array is empty!" << std::endl;
        return 1;
    }
    
    // Find maximum element
    int maxElement = *std::max_element(arr.begin(), arr.end());
    
    // Generate random filename
    std::string fileName = generateRandomFileName();
    
    // Save the maximum value to the file
    std::ofstream file(fileName);
    if (file.is_open()) {
        file << maxElement << std::endl;
        file.close();
        std::cout << "Maximum value " << maxElement << " saved to file: " << fileName << std::endl;
    } else {
        std::cout << "Could not open file for writing!" << std::endl;
        return 1;
    }
    
    return 0;
}