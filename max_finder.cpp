#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>
#include <ctime>

// Function to generate a random filename
std::string generateRandomFilename() {
    const std::string charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    std::string filename = "output_";
    
    // Use current time as seed for random number generation
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, charset.size() - 1);
    
    // Generate a random suffix of 8 characters
    for (int i = 0; i < 8; ++i) {
        filename += charset[dis(gen)];
    }
    
    filename += ".txt";
    return filename;
}

int main() {
    // Example array - in a real application you might read from user input or file
    std::vector<int> arr = {3, 7, 2, 9, 1, 5, 8, 4, 6};
    
    // Find the maximum element in the array
    if (arr.empty()) {
        std::cout << "Array is empty!" << std::endl;
        return 1;
    }
    
    int maxElement = *std::max_element(arr.begin(), arr.end());
    
    std::cout << "Array elements: ";
    for (int num : arr) {
        std::cout << num << " ";
    }
    std::cout << std::endl;
    std::cout << "Maximum element: " << maxElement << std::endl;
    
    // Generate a random filename
    std::string filename = generateRandomFilename();
    
    // Write the maximum element to the file
    std::ofstream outFile(filename);
    if (outFile.is_open()) {
        outFile << maxElement;
        outFile.close();
        std::cout << "Maximum element saved to file: " << filename << std::endl;
    } else {
        std::cout << "Unable to open file for writing." << std::endl;
        return 1;
    }
    
    return 0;
}