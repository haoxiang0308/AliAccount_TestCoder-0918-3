#include <iostream>
#include <fstream>
#include <string>
#include <random>
#include <sstream>

// 模板函数：交换两个变量的值
template<typename T>
void swapValues(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

// 生成随机文件名
std::string generateRandomFilename(const std::string& extension = ".txt") {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(100000, 999999); // 生成6位随机数
    
    std::ostringstream oss;
    oss << "random_file_" << dis(gen) << extension;
    return oss.str();
}

// 模板函数：将交换后的值保存到随机命名的文件中
template<typename T>
void saveSwappedValues(T& a, T& b, const std::string& filename) {
    // 先交换值
    swapValues(a, b);
    
    // 将结果保存到文件
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "After swap:\n";
        file << "Value 1: " << a << "\n";
        file << "Value 2: " << b << "\n";
        file.close();
        std::cout << "Values saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << " for writing." << std::endl;
    }
}

// 重载版本：不修改原值，仅保存到文件
template<typename T>
void saveSwappedValuesToFile(T a, T b, const std::string& filename) {
    // 交换副本的值
    swapValues(a, b);
    
    // 将交换后的值保存到文件
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Swapped values:\n";
        file << "First value: " << a << "\n";
        file << "Second value: " << b << "\n";
        file.close();
        std::cout << "Swapped values saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << " for writing." << std::endl;
    }
}

int main() {
    // 示例：整数交换
    int int1 = 10, int2 = 20;
    std::cout << "Original integers: " << int1 << ", " << int2 << std::endl;
    
    std::string intFilename = generateRandomFilename(".txt");
    saveSwappedValuesToFile(int1, int2, intFilename);
    std::cout << "Original values after function call: " << int1 << ", " << int2 << " (unchanged)\n\n";
    
    // 示例：浮点数交换
    double double1 = 3.14, double2 = 2.71;
    std::cout << "Original doubles: " << double1 << ", " << double2 << std::endl;
    
    std::string doubleFilename = generateRandomFilename(".txt");
    saveSwappedValues(double1, double2, doubleFilename);  // 这个会修改原始值
    std::cout << "Values after swap function: " << double1 << ", " << double2 << " (changed)\n\n";
    
    // 示例：字符串交换
    std::string str1 = "Hello";
    std::string str2 = "World";
    std::cout << "Original strings: " << str1 << ", " << str2 << std::endl;
    
    std::string strFilename = generateRandomFilename(".txt");
    saveSwappedValuesToFile(str1, str2, strFilename);
    std::cout << "Original strings after function call: " << str1 << ", " << str2 << " (unchanged)\n";
    
    return 0;
}