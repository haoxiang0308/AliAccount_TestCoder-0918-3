#include <iostream>
#include <vector>
#include <algorithm>
#include <random>
#include <ctime>

int main() {
    // Initialize random seed
    std::srand(std::time(0));
    
    // Create an array with random numbers
    std::vector<int> numbers(10);
    std::cout << "Array elements: ";
    for (int& num : numbers) {
        num = std::rand() % 100; // Random numbers between 0 and 99
        std::cout << num << " ";
    }
    std::cout << std::endl;
    
    // Find maximum element
    int max_element = *std::max_element(numbers.begin(), numbers.end());
    
    // Alternative method without using std::max_element
    int max_element_manual = numbers[0];
    for (int i = 1; i < numbers.size(); i++) {
        if (numbers[i] > max_element_manual) {
            max_element_manual = numbers[i];
        }
    }
    
    // Output results
    std::cout << "Maximum element (using std::max_element): " << max_element << std::endl;
    std::cout << "Maximum element (manual method): " << max_element_manual << std::endl;
    
    return 0;
}