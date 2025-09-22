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
    
    // Generate random array size between 5 and 15
    int size = dis(gen) % 11 + 5;
    
    // Create vector with random numbers
    std::vector<int> arr(size);
    std::cout << "Generated array: ";
    for (int i = 0; i < size; i++) {
        arr[i] = dis(gen);
        std::cout << arr[i] << " ";
    }
    std::cout << std::endl;
    
    // Find maximum element using std::max_element
    int max_val = *std::max_element(arr.begin(), arr.end());
    
    // Alternative method without using std::max_element
    int max_val_alt = arr[0];
    for (int i = 1; i < size; i++) {
        if (arr[i] > max_val_alt) {
            max_val_alt = arr[i];
        }
    }
    
    // Output the maximum value
    std::cout << "Maximum value (using std::max_element): " << max_val << std::endl;
    std::cout << "Maximum value (using loop): " << max_val_alt << std::endl;
    
    return 0;
}