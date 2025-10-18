#include <iostream>
#include <fstream>
#include <string>
#include <random>
#include <sstream>

// 模板函数：交换两个变量的值
template<typename T>
void swap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

// 生成随机文件名
std::string generateRandomFilename(const std::string& extension = ".txt") {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, 999999);
    
    std::ostringstream oss;
    oss << "random_file_" << dis(gen) << extension;
    return oss.str();
}

// 模板函数：交换两个变量并将结果保存到随机命名的文件中
template<typename T>
void swapAndSave(T& a, T& b, const std::string& variableNameA = "variableA", const std::string& variableNameB = "variableB") {
    std::cout << "Before swap:" << std::endl;
    std::cout << variableNameA << " = " << a << std::endl;
    std::cout << variableNameB << " = " << b << std::endl;
    
    // 执行交换
    swap(a, b);
    
    std::cout << "\nAfter swap:" << std::endl;
    std::cout << variableNameA << " = " << a << std::endl;
    std::cout << variableNameB << " = " << b << std::endl;
    
    // 生成随机文件名
    std::string filename = generateRandomFilename(".txt");
    
    // 将结果保存到文件
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Swap Result:\n";
        file << variableNameA << " = " << a << "\n";
        file << variableNameB << " = " << b << "\n";
        file.close();
        std::cout << "\nResult saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << " for writing." << std::endl;
    }
}

// 示例用法
int main() {
    // 测试整数交换
    int x = 10, y = 20;
    std::cout << "=== Integer Swap ===" << std::endl;
    swapAndSave(x, y, "x", "y");
    
    std::cout << "\n" << "=== String Swap ===" << std::endl;
    // 测试字符串交换
    std::string str1 = "Hello", str2 = "World";
    swapAndSave(str1, str2, "str1", "str2");
    
    std::cout << "\n" << "=== Double Swap ===" << std::endl;
    // 测试双精度浮点数交换
    double d1 = 3.14, d2 = 6.28;
    swapAndSave(d1, d2, "d1", "d2");
    
    return 0;
}