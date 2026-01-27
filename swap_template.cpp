#include <iostream>
#include <string>
#include <random>
#include <fstream>

// 模板函数：交换两个变量的值
template <typename T>
void swap(T& a, T& b) {
    T temp = std::move(a);
    a = std::move(b);
    b = std::move(temp);
}

// 生成随机文件名
std::string generateRandomFilename() {
    const std::string chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, chars.size() - 1);
    
    std::string filename = "swap_result_";
    for (int i = 0; i < 8; ++i) {
        filename += chars[dis(gen)];
    }
    filename += ".txt";
    
    return filename;
}

// 将交换结果保存到文件
template <typename T>
void saveSwapResult(const T& a, const T& b, const std::string& filename) {
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "交换前的值:\n";
        file << "a = " << a << "\n";
        file << "b = " << b << "\n\n";
        file.close();
    }
}

int main() {
    // 测试整数交换
    int x = 10, y = 20;
    std::cout << "交换前: x = " << x << ", y = " << y << std::endl;
    
    swap(x, y);
    
    std::cout << "交换后: x = " << x << ", y = " << y << std::endl;
    
    // 保存结果到随机命名的文件
    std::string filename = generateRandomFilename();
    saveSwapResult(x, y, filename);
    std::cout << "结果已保存到文件: " << filename << std::endl;
    
    // 测试浮点数交换
    double a = 3.14, b = 2.71;
    std::cout << "\n交换前: a = " << a << ", b = " << b << std::endl;
    
    swap(a, b);
    
    std::cout << "交换后: a = " << a << ", b = " << b << std::endl;
    
    // 可以用标准库的std::swap作为对比
    // std::swap(a, b);
    
    return 0;
}