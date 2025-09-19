#include <iostream>
#include <vector>
#include <algorithm>
#include <random>
#include <ctime>

int main() {
    // Initialize random seed
    std::srand(std::time(0));
    
    // Create an array with random numbers
    std::vector<int> arr(10);
    std::cout << "Array elements: ";
    for (int i = 0; i < 10; ++i) {
        arr[i] = std::rand() % 100; // Random numbers between 0 and 99
        std::cout << arr[i] << " ";
    }
    std::cout << std::endl;
    
    // Find maximum element
    int max_element = *std::max_element(arr.begin(), arr.end());
    
    // Output the result
    std::cout << "Maximum element: " << max_element << std::endl;
    
    return 0;
}