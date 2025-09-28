#include <iostream>

// Template function to swap two variables
template<typename T>
void mySwap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

int main() {
    int x = 5, y = 10;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    mySwap(x, y);
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;

    double p = 1.1, q = 2.2;
    std::cout << "Before swap: p = " << p << ", q = " << q << std::endl;
    mySwap(p, q);
    std::cout << "After swap: p = " << p << ", q = " << q << std::endl;

    return 0;
}