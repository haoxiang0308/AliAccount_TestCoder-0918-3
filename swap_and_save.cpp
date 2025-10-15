#include <iostream>
#include <fstream>
#include <string>
#include <random>
#include <chrono>

// 模板函数：交换两个变量的值
template<typename T>
void swapValues(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

// 生成随机文件名
std::string generateRandomFileName(const std::string& extension = ".txt") {
    // 使用当前时间作为随机种子
    auto seed = std::chrono::high_resolution_clock::now().time_since_epoch().count();
    std::mt19937 generator(seed);
    std::uniform_int_distribution<int> distribution(100000, 999999); // 生成6位随机数
    
    int randomNum = distribution(generator);
    return "swap_result_" + std::to_string(randomNum) + extension;
}

// 将交换后的值保存到随机命名的文件中
template<typename T>
void saveSwapResult(T& a, T& b, const std::string& filename) {
    // 先交换值
    swapValues(a, b);
    
    // 保存到文件
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

// 示例使用
int main() {
    // 测试整数
    int x = 10, y = 20;
    std::cout << "Before swap - x: " << x << ", y: " << y << std::endl;
    
    std::string filename1 = generateRandomFileName(".txt");
    saveSwapResult(x, y, filename1);
    std::cout << "After swap in function - x: " << x << ", y: " << y << std::endl;
    
    // 测试浮点数
    double a = 3.14, b = 2.71;
    std::cout << "\nBefore swap - a: " << a << ", b: " << b << std::endl;
    
    std::string filename2 = generateRandomFileName(".txt");
    saveSwapResult(a, b, filename2);
    std::cout << "After swap in function - a: " << a << ", b: " << b << std::endl;
    
    // 测试字符串
    std::string str1 = "Hello", str2 = "World";
    std::cout << "\nBefore swap - str1: " << str1 << ", str2: " << str2 << std::endl;
    
    std::string filename3 = generateRandomFileName(".txt");
    saveSwapResult(str1, str2, filename3);
    std::cout << "After swap in function - str1: " << str1 << ", str2: " << str2 << std::endl;
    
    return 0;
}