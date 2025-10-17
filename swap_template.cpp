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

// 生成随机文件名的辅助函数
std::string generate_random_filename(const std::string& extension = ".txt") {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, 999999);
    
    std::ostringstream oss;
    oss << "swap_output_" << dis(gen) << extension;
    return oss.str();
}

// 将交换后的值保存到随机命名的文件中
template<typename T>
void save_swap_to_file(T& a, T& b, const std::string& description = "") {
    // 交换值
    swap_values(a, b);
    
    // 生成随机文件名
    std::string filename = generate_random_filename(".txt");
    
    // 将结果写入文件
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Swap Result:\n";
        if (!description.empty()) {
            file << "Description: " << description << "\n";
        }
        file << "First value: " << a << "\n";
        file << "Second value: " << b << "\n";
        file.close();
        std::cout << "Values swapped and saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << " for writing." << std::endl;
    }
}

// 示例用法
int main() {
    // 测试整数
    int x = 10, y = 20;
    std::cout << "Before swap - x: " << x << ", y: " << y << std::endl;
    save_swap_to_file(x, y, "Integer swap example");
    std::cout << "After swap - x: " << x << ", y: " << y << std::endl << std::endl;
    
    // 测试浮点数
    double a = 3.14, b = 2.71;
    std::cout << "Before swap - a: " << a << ", b: " << b << std::endl;
    save_swap_to_file(a, b, "Double swap example");
    std::cout << "After swap - a: " << a << ", b: " << b << std::endl << std::endl;
    
    // 测试字符串
    std::string str1 = "Hello", str2 = "World";
    std::cout << "Before swap - str1: " << str1 << ", str2: " << str2 << std::endl;
    save_swap_to_file(str1, str2, "String swap example");
    std::cout << "After swap - str1: " << str1 << ", str2: " << str2 << std::endl;
    
    return 0;
}