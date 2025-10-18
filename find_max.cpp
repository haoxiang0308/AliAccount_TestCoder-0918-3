#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>
#include <ctime>

std::string generateRandomFileName() {
    const std::string charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    std::string fileName = "max_result_";
    
    // Use time as seed for random number generator
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, charset.size() - 1);
    
    // Generate a random suffix of 8 characters
    for (int i = 0; i < 8; ++i) {
        fileName += charset[dis(gen)];
    }
    
    fileName += ".txt";
    return fileName;
}

int findMax(const std::vector<int>& arr) {
    if (arr.empty()) {
        throw std::runtime_error("Array is empty");
    }
    
    int max = arr[0];
    for (size_t i = 1; i < arr.size(); ++i) {
        if (arr[i] > max) {
            max = arr[i];
        }
    }
    return max;
}

int main() {
    // Example array - you can modify this as needed
    std::vector<int> numbers = {3, 7, 2, 9, 1, 5, 8, 4, 6, 10, -2, 15, 12};
    
    try {
        int maxNumber = findMax(numbers);
        
        std::string fileName = generateRandomFileName();
        
        std::ofstream file(fileName);
        if (!file.is_open()) {
            std::cerr << "Error: Could not open file " << fileName << " for writing." << std::endl;
            return 1;
        }
        
        file << "Maximum number in the array: " << maxNumber << std::endl;
        file.close();
        
        std::cout << "Maximum number found: " << maxNumber << std::endl;
        std::cout << "Result saved to file: " << fileName << std::endl;
        
    } catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << std::endl;
        return 1;
    }
    
    return 0;
}