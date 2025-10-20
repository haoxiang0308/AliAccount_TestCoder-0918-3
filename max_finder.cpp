#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>

std::string generateRandomFilename() {
    const std::string charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, charset.size() - 1);
    
    std::string filename = "output_";
    for (int i = 0; i < 10; ++i) {
        filename += charset[dis(gen)];
    }
    filename += ".txt";
    
    return filename;
}

int findMax(const std::vector<int>& arr) {
    if (arr.empty()) {
        throw std::invalid_argument("Array is empty");
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
        
        std::string filename = generateRandomFilename();
        
        std::ofstream file(filename);
        if (!file.is_open()) {
            std::cerr << "Error: Could not create file " << filename << std::endl;
            return 1;
        }
        
        file << "Maximum number in the array: " << maxNumber << std::endl;
        file << "Array elements: ";
        for (size_t i = 0; i < numbers.size(); ++i) {
            file << numbers[i];
            if (i < numbers.size() - 1) file << " ";
        }
        file << std::endl;
        
        file.close();
        
        std::cout << "Maximum number " << maxNumber << " found and saved to " << filename << std::endl;
        
    } catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << std::endl;
        return 1;
    }
    
    return 0;
}