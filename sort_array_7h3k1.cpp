#include <iostream>
#include <vector>
#include <algorithm>

void printArray(const std::vector<int>& arr) {
    for (int num : arr) {
        std::cout << num << " ";
    }
    std::cout << std::endl;
}

int main() {
    // Example array
    std::vector<int> numbers = {64, 34, 25, 12, 22, 11, 90};

    std::cout << "Original array: ";
    printArray(numbers);

    // Sort the array in ascending order
    std::sort(numbers.begin(), numbers.end());

    std::cout << "Sorted array in ascending order: ";
    printArray(numbers);

    return 0;
}