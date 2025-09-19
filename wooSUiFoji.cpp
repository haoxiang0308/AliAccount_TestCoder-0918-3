#include <iostream>
#include <string>

// C++模板函数用于交换两个变量的值
template<typename T>
void swapValues(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

int main() {
    // 测试整数交换
    int x = 10, y = 20;
    std::cout << "交换前: x = " << x << ", y = " << y << std::endl;
    swapValues(x, y);
    std::cout << "交换后: x = " << x << ", y = " << y << std::endl;
    
    // 测试浮点数交换
    double a = 3.14, b = 2.71;
    std::cout << "交换前: a = " << a << ", b = " << b << std::endl;
    swapValues(a, b);
    std::cout << "交换后: a = " << a << ", b = " << b << std::endl;
    
    // 测试字符串交换
    std::string s1 = "Hello", s2 = "World";
    std::cout << "交换前: s1 = " << s1 << ", s2 = " << s2 << std::endl;
    swapValues(s1, s2);
    std::cout << "交换后: s1 = " << s1 << ", s2 = " << s2 << std::endl;
    
    return 0;
}