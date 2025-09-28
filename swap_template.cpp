#include <iostream>
#include <fstream>
#include <string>
#include <random>

// Template function to swap two variables
template<typename T>
void mySwap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

// Function to generate a random filename
std::string generateRandomFilename(const std::string& extension = ".txt") {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(10000, 99999); // Generate a random 5-digit number
    return "swap_output_" + std::to_string(dis(gen)) + extension;
}

int main() {
    // Example with integers
    int x = 5;
    int y = 10;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    mySwap(x, y);
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;

    // Example with doubles
    double a = 3.14;
    double b = 6.28;
    std::cout << "Before swap: a = " << a << ", b = " << b << std::endl;
    mySwap(a, b);
    std::cout << "After swap: a = " << a << ", b = " << b << std::endl;

    // Save results to a random file
    std::string filename = generateRandomFilename(".cpp_result");
    std::ofstream outFile(filename);
    if (outFile.is_open()) {
        outFile << "Integer swap: x = " << x << ", y = " << y << std::endl;
        outFile << "Double swap: a = " << a << ", b = " << b << std::endl;
        outFile.close();
        std::cout << "Results saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Could not open file for writing." << std::endl;
        return 1;
    }

    return 0;
}