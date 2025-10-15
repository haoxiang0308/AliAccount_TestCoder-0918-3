#include <iostream>
#include <fstream>
#include <string>
#include <random>
#include <ctime>

// 模板函数：交换两个变量的值
template<typename T>
void swapValues(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

// 生成随机文件名
std::string generateRandomFileName(const std::string& extension = ".txt") {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(100000, 999999); // 生成6位随机数
    
    // 使用时间作为额外的随机因子
    auto now = std::time(nullptr);
    std::string filename = "swap_data_" + std::to_string(now) + "_" + std::to_string(dis(gen)) + extension;
    
    return filename;
}

// 将交换后的值保存到随机命名的文件中
template<typename T>
std::string saveSwappedValues(T& a, T& b, const std::string& varNameA = "a", const std::string& varNameB = "b") {
    // 先交换值
    swapValues(a, b);
    
    // 生成随机文件名
    std::string filename = generateRandomFileName(".txt");
    
    // 打开文件并写入交换后的值
    std::ofstream file(filename);
    if (file.is_open()) {
        file << varNameA << " = " << a << std::endl;
        file << varNameB << " = " << b << std::endl;
        file.close();
        std::cout << "Swapped values saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << " for writing." << std::endl;
        return "";
    }
    
    return filename;
}

// 示例用法
int main() {
    // 测试整数
    int x = 10, y = 20;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    std::string file1 = saveSwappedValues(x, y, "x", "y");
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl << std::endl;
    
    // 测试浮点数
    double a = 3.14, b = 2.71;
    std::cout << "Before swap: a = " << a << ", b = " << b << std::endl;
    std::string file2 = saveSwappedValues(a, b, "a", "b");
    std::cout << "After swap: a = " << a << ", b = " << b << std::endl << std::endl;
    
    // 测试字符串
    std::string str1 = "Hello", str2 = "World";
    std::cout << "Before swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    std::string file3 = saveSwappedValues(str1, str2, "str1", "str2");
    std::cout << "After swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    
    return 0;
}