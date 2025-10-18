#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>
#include <ctime>

std::string generateRandomFileName() {
    const std::string charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    std::string result = "output_";
    
    // Use time as seed for random number generator
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, charset.size() - 1);
    
    // Generate a random string of 10 characters
    for (int i = 0; i < 10; ++i) {
        result += charset[dis(gen)];
    }
    
    result += ".txt";
    return result;
}

int main() {
    // Define an array of integers
    std::vector<int> arr = {3, 7, 2, 9, 1, 5, 8, 4, 6, 10};
    
    // Find the maximum element
    int max_element = *std::max_element(arr.begin(), arr.end());
    
    // Generate a random file name
    std::string filename = generateRandomFileName();
    
    // Write the maximum element to the file
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Maximum element in the array: " << max_element << std::endl;
        file.close();
        std::cout << "Maximum element " << max_element << " saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Unable to open file " << filename << std::endl;
        return 1;
    }
    
    return 0;
}