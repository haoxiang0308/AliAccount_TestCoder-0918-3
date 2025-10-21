#include <iostream>
#include <algorithm>
#include <vector>

void printArray(const std::vector<int>& arr) {
    for (int i = 0; i < arr.size(); i++) {
        std::cout << arr[i];
        if (i < arr.size() - 1) {
            std::cout << ", ";
        }
    }
    std::cout << std::endl;
}

int main() {
    // Example array to sort
    std::vector<int> arr = {64, 34, 25, 12, 22, 11, 90, 88, 76, 50, 42};
    
    std::cout << "Original array: ";
    printArray(arr);
    
    // Sort the array in ascending order
    std::sort(arr.begin(), arr.end());
    
    std::cout << "Sorted array (ascending): ";
    printArray(arr);
    
    return 0;
}