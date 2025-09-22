#include <iostream>
#include <vector>
#include <algorithm>
#include <random>
#include <ctime>

int main() {
    // Create a random number generator
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(1, 100);

    // Generate a random array size between 5 and 15
    int size = dis(gen) % 11 + 5;
    
    // Create vector with random numbers
    std::vector<int> arr(size);
    std::cout << "Generated array: ";
    for (int i = 0; i < size; ++i) {
        arr[i] = dis(gen);
        std::cout << arr[i] << " ";
    }
    std::cout << std::endl;

    // Find maximum element
    int max_element = *std::max_element(arr.begin(), arr.end());
    
    // Output the result
    std::cout << "Maximum element in the array: " << max_element << std::endl;

    return 0;
}