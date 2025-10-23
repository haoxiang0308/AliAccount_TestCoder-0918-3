#include <iostream>
#include <vector>
#include <algorithm>

// Function to print the array
void printArray(const std::vector<int>& arr) {
    for (int i = 0; i < arr.size(); ++i) {
        std::cout << arr[i];
        if (i < arr.size() - 1) {
            std::cout << ", ";
        }
    }
    std::cout << std::endl;
}

int main() {
    // Example array to sort
    std::vector<int> arr = {64, 34, 25, 12, 22, 11, 90, 5};
    
    std::cout << "Original array: ";
    printArray(arr);
    
    // Sort the array in ascending order
    std::sort(arr.begin(), arr.end());
    
    std::cout << "Sorted array (ascending): ";
    printArray(arr);
    
    // Allow user to input their own array
    std::cout << "\nEnter the number of elements in your array: ";
    int n;
    std::cin >> n;
    
    std::vector<int> userArr(n);
    std::cout << "Enter " << n << " integers: ";
    for (int i = 0; i < n; ++i) {
        std::cin >> userArr[i];
    }
    
    std::cout << "Your original array: ";
    printArray(userArr);
    
    // Sort the user's array
    std::sort(userArr.begin(), userArr.end());
    
    std::cout << "Your sorted array (ascending): ";
    printArray(userArr);
    
    return 0;
}