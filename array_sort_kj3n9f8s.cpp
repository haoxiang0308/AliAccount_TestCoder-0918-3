#include <iostream>
#include <algorithm>
#include <vector>

int main() {
    // Initialize an array of integers
    std::vector<int> arr = {64, 34, 25, 12, 22, 11, 90, 5};
    
    // Get the size of the array
    int n = arr.size();
    
    // Display the original array
    std::cout << "Original array: ";
    for (int i = 0; i < n; i++) {
        std::cout << arr[i] << " ";
    }
    std::cout << std::endl;
    
    // Sort the array in ascending order
    std::sort(arr.begin(), arr.end());
    
    // Display the sorted array
    std::cout << "Sorted array in ascending order: ";
    for (int i = 0; i < n; i++) {
        std::cout << arr[i] << " ";
    }
    std::cout << std::endl;
    
    return 0;
}