#include <iostream>
#include <utility> // Required for std::swap (though we are implementing our own)

// Template function to swap two variables of any type
template<typename T>
void my_swap(T& a, T& b) {
    T temp = std::move(a); // Use move semantics for efficiency, falls back to copy
    a = std::move(b);
    b = temp;
}

int main() {
    int x = 5, y = 10;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    my_swap(x, y);
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;

    std::string s1 = "Hello", s2 = "World";
    std::cout << "Before swap: s1 = " << s1 << ", s2 = " << s2 << std::endl;
    my_swap(s1, s2);
    std::cout << "After swap: s1 = " << s1 << ", s2 = " << s2 << std::endl;

    return 0;
}