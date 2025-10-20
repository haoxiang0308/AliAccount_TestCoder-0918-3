#include <iostream>
#include <algorithm>
#include <vector>

// Function to sort an array in ascending order
void sortArray(int arr[], int size) {
    std::sort(arr, arr + size);
}

// Function to print the array
void printArray(int arr[], int size) {
    for (int i = 0; i < size; i++) {
        std::cout << arr[i] << " ";
    }
    std::cout << std::endl;
}

int main() {
    // Example array
    int arr[] = {64, 34, 25, 12, 22, 11, 90, 5};
    int size = sizeof(arr) / sizeof(arr[0]);
    
    std::cout << "Original array: ";
    printArray(arr, size);
    
    sortArray(arr, size);
    
    std::cout << "Sorted array in ascending order: ";
    printArray(arr, size);
    
    return 0;
}