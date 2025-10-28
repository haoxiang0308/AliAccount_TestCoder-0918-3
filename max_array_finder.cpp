#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>
#include <ctime>

std::string generateRandomFileName() {
    const std::string charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    std::string fileName = "";
    
    // Use current time to seed random number generator
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, charset.size() - 1);
    
    // Generate a random name of 10 characters
    for (int i = 0; i < 10; ++i) {
        fileName += charset[dis(gen)];
    }
    
    // Add .txt extension
    fileName += ".txt";
    return fileName;
}

int findMaxInArray(const std::vector<int>& arr) {
    if (arr.empty()) {
        throw std::runtime_error("Array is empty!");
    }
    
    int maxVal = arr[0];
    for (int i = 1; i < arr.size(); ++i) {
        if (arr[i] > maxVal) {
            maxVal = arr[i];
        }
    }
    return maxVal;
}

int main() {
    // Example array - you can modify this as needed
    std::vector<int> numbers = {3, 7, 2, 9, 1, 5, 12, 8, 4, 11};
    
    try {
        // Find the maximum value in the array
        int maxNumber = findMaxInArray(numbers);
        
        // Generate a random file name
        std::string fileName = generateRandomFileName();
        
        // Save the maximum number to the file
        std::ofstream outFile(fileName);
        if (!outFile.is_open()) {
            std::cerr << "Error: Could not create file " << fileName << std::endl;
            return 1;
        }
        
        outFile << maxNumber << std::endl;
        outFile.close();
        
        std::cout << "Maximum number in the array: " << maxNumber << std::endl;
        std::cout << "Saved to file: " << fileName << std::endl;
        
        // Print the array for verification
        std::cout << "Array: ";
        for (size_t i = 0; i < numbers.size(); ++i) {
            std::cout << numbers[i] << " ";
            if (i < numbers.size() - 1) std::cout << ", ";
        }
        std::cout << std::endl;
        
    } catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << std::endl;
        return 1;
    }
    
    return 0;
}