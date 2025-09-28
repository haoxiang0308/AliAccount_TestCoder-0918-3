#include <iostream>
#include <string>
#include <fstream>
#include <cstdlib> // For rand()

// Template function to swap two variables
template<typename T>
void mySwap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

int main() {
    // Example usage with integers
    int x = 10;
    int y = 20;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    mySwap(x, y);
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;

    // Example usage with strings
    std::string str1 = "Hello";
    std::string str2 = "World";
    std::cout << "Before swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    mySwap(str1, str2);
    std::cout << "After swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;

    // Save the code to a randomly named file
    // This part is handled by the outer program logic
    return 0;
}
