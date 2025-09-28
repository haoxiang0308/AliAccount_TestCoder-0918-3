#include <iostream>
using namespace std;

// Template function to swap two variables
template<typename T>
void swap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

int main() {
    int x = 5, y = 10;
    cout << "Before swap: x = " << x << ", y = " << y << endl;
    swap(x, y);
    cout << "After swap: x = " << x << ", y = " << y << endl;

    double m = 3.14, n = 2.71;
    cout << "Before swap: m = " << m << ", n = " << n << endl;
    swap(m, n);
    cout << "After swap: m = " << m << ", n = " << n << endl;

    return 0;
}