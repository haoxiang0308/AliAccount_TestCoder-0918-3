#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>

int main() {
    // Define an array of integers
    std::vector<int> arr = {3, 7, 2, 9, 1, 8, 5, 4, 6};
    
    // Find the maximum element
    int max_element = *std::max_element(arr.begin(), arr.end());
    
    // Generate a random filename
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(1000, 9999);
    int random_num = dis(gen);
    std::string filename = "max_result_" + std::to_string(random_num) + ".txt";
    
    // Write the maximum element to the file
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Maximum element in the array: " << max_element << std::endl;
        file.close();
        std::cout << "Maximum element " << max_element << " has been written to " << filename << std::endl;
    } else {
        std::cerr << "Unable to open file for writing" << std::endl;
        return 1;
    }
    
    return 0;
}