#include <iostream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>

int main() {
    // Example array, in practice you might read from input or initialize differently
    std::vector<int> arr = {3, 7, 2, 9, 1};

    if (arr.empty()) {
        std::cout << "Array is empty." << std::endl;
        return 1;
    }

    int max_val = *std::max_element(arr.begin(), arr.end());
    std::cout << "The maximum value in the array is: " << max_val << std::endl;

    return 0;
}