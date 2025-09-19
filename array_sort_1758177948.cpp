#include <iostream>
#include <algorithm>
#include <vector>

int main() {
    // Initialize an array of integers
    std::vector<int> arr = {64, 34, 25, 12, 22, 11, 90, 5};
    
    // Print the original array
    std::cout << "Original array: ";
    for (int i = 0; i < arr.size(); i++) {
        std::cout << arr[i] << " ";
    }
    std::cout << std::endl;
    
    // Sort the array in ascending order
    std::sort(arr.begin(), arr.end());
    
    // Print the sorted array
    std::cout << "Sorted array: ";
    for (int i = 0; i < arr.size(); i++) {
        std::cout << arr[i] << " ";
    }
    std::cout << std::endl;
    
    return 0;
}