#include <iostream>
#include <fstream>
#include <string>
#include <random>
#include <sstream>

// 模板函数：交换两个变量的值
template<typename T>
void swap_values(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

// 生成随机文件名
std::string generate_random_filename(const std::string& extension = ".txt") {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(10000, 99999);
    
    std::ostringstream oss;
    oss << "swap_result_" << dis(gen) << extension;
    return oss.str();
}

// 将交换后的值保存到随机命名的文件中
template<typename T>
void save_swap_result(T& a, T& b, const std::string& description = "") {
    // 先交换值
    swap_values(a, b);
    
    // 生成随机文件名
    std::string filename = generate_random_filename(".txt");
    
    // 保存到文件
    std::ofstream file(filename);
    if (file.is_open()) {
        if (!description.empty()) {
            file << description << std::endl;
        }
        file << "After swap:" << std::endl;
        file << "First value: " << a << std::endl;
        file << "Second value: " << b << std::endl;
        file.close();
        std::cout << "Values swapped and saved to: " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << " for writing." << std::endl;
    }
}

// 示例用法
int main() {
    // 测试整数
    int x = 10, y = 20;
    std::cout << "Before swap - x: " << x << ", y: " << y << std::endl;
    save_swap_result(x, y, "Integer swap example");
    std::cout << "After function call - x: " << x << ", y: " << y << std::endl;
    
    std::cout << std::endl;
    
    // 测试字符串
    std::string str1 = "Hello", str2 = "World";
    std::cout << "Before swap - str1: " << str1 << ", str2: " << str2 << std::endl;
    save_swap_result(str1, str2, "String swap example");
    std::cout << "After function call - str1: " << str1 << ", str2: " << str2 << std::endl;
    
    std::cout << std::endl;
    
    // 测试浮点数
    double a = 3.14, b = 2.71;
    std::cout << "Before swap - a: " << a << ", b: " << b << std::endl;
    save_swap_result(a, b, "Double swap example");
    std::cout << "After function call - a: " << a << ", b: " << b << std::endl;
    
    return 0;
}