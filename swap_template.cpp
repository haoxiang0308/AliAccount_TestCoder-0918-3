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
    std::uniform_int_distribution<> dis(100000, 999999); // 生成6位随机数
    
    std::ostringstream oss;
    oss << "swap_result_" << dis(gen) << extension;
    return oss.str();
}

// 将交换后的值保存到随机命名的文件中
template<typename T>
bool save_swap_result(T& a, T& b, const std::string& filename) {
    std::ofstream file(filename);
    if (!file.is_open()) {
        return false;
    }
    
    // 交换值
    swap_values(a, b);
    
    // 将交换后的值写入文件
    file << "After swap:\n";
    file << "a = " << a << "\n";
    file << "b = " << b << "\n";
    
    file.close();
    return true;
}

int main() {
    // 示例：交换整数
    int x = 10, y = 20;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    
    std::string filename = generate_random_filename(".txt");
    bool result = save_swap_result(x, y, filename);
    
    if (result) {
        std::cout << "Values swapped and saved to file: " << filename << std::endl;
        std::cout << "After swap: x = " << x << ", y = " << y << std::endl;
    } else {
        std::cout << "Failed to save to file." << std::endl;
    }
    
    // 示例：交换浮点数
    double a = 3.14, b = 2.71;
    std::cout << "\nBefore swap: a = " << a << ", b = " << b << std::endl;
    
    filename = generate_random_filename(".txt");
    result = save_swap_result(a, b, filename);
    
    if (result) {
        std::cout << "Values swapped and saved to file: " << filename << std::endl;
        std::cout << "After swap: a = " << a << ", b = " << b << std::endl;
    } else {
        std::cout << "Failed to save to file." << std::endl;
    }
    
    // 示例：交换字符串
    std::string str1 = "Hello", str2 = "World";
    std::cout << "\nBefore swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    
    filename = generate_random_filename(".txt");
    result = save_swap_result(str1, str2, filename);
    
    if (result) {
        std::cout << "Values swapped and saved to file: " << filename << std::endl;
        std::cout << "After swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    } else {
        std::cout << "Failed to save to file." << std::endl;
    }
    
    return 0;
}