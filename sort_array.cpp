#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    // Example array, you can change the values or size as needed
    std::vector<int> arr = {64, 34, 25, 12, 22, 11, 90};

    std::cout << "Original array: ";
    for (int num : arr) {
        std::cout << num << " ";
    }
    std::cout << std::endl;

    // Sort the array in ascending order
    std::sort(arr.begin(), arr.end());

    std::cout << "Sorted array (ascending): ";
    for (int num : arr) {
        std::cout << num << " ";
    }
    std::cout << std::endl;

    return 0;
}