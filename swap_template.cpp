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
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "After swap:\n";
        file << "a = " << a << "\n";
        file << "b = " << b << "\n";
        file.close();
        std::cout << "Swap result saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << " for writing." << std::endl;
    }
}

// 完整的交换并保存函数
template<typename T>
void swapAndSave(T& a, T& b) {
    swapValues(a, b);
    std::string filename = generateRandomFileName();
    saveSwapResult(a, b, filename);
}

int main() {
    // 示例：交换整数
    int x = 10, y = 20;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    swapAndSave(x, y);
    std::cout << "After swap in main: x = " << x << ", y = " << y << std::endl;
    
    std::cout << std::endl;
    
    // 示例：交换浮点数
    double a = 3.14, b = 2.71;
    std::cout << "Before swap: a = " << a << ", b = " << b << std::endl;
    swapAndSave(a, b);
    std::cout << "After swap in main: a = " << a << ", b = " << b << std::endl;
    
    std::cout << std::endl;
    
    // 示例：交换字符串
    std::string str1 = "Hello", str2 = "World";
    std::cout << "Before swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    swapAndSave(str1, str2);
    std::cout << "After swap in main: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    
    return 0;
}