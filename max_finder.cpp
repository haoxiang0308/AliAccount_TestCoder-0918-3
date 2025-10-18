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
    std::string filename = "result_";
    
    // Use time as seed for random number generator
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, charset.size() - 1);
    
    // Generate 10 random characters for the filename
    for (int i = 0; i < 10; ++i) {
        filename += charset[dis(gen)];
    }
    
    filename += ".txt";
    return filename;
}

int main() {
    // Example array - you can modify this as needed
    std::vector<int> array = {3, 7, 2, 9, 1, 8, 5, 6, 4};
    
    // Find the maximum element
    int max_value = *std::max_element(array.begin(), array.end());
    
    // Generate a random filename
    std::string filename = generateRandomFilename();
    
    // Save the maximum value to the file
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Maximum value in the array: " << max_value << std::endl;
        file.close();
        std::cout << "Maximum value " << max_value << " found and saved to " << filename << std::endl;
    } else {
        std::cerr << "Unable to open file " << filename << std::endl;
        return 1;
    }
    
    return 0;
}