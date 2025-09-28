#include <iostream>
#include <fstream>
#include <string>
#include <random>

// 模板函数：交换两个变量的值
template<typename T>
void mySwap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

// 生成一个随机文件名
std::string generateRandomFileName(const std::string& extension = ".txt") {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(10000, 99999);
    return "random_file_" + std::to_string(dis(gen)) + extension;
}

int main() {
    // 示例：交换两个整数
    int x = 5;
    int y = 10;
    std::cout << "交换前: x = " << x << ", y = " << y << std::endl;
    mySwap(x, y);
    std::cout << "交换后: x = " << x << ", y = " << y << std::endl;

    // 示例：交换两个字符串
    std::string str1 = "Hello";
    std::string str2 = "World";
    std::cout << "交换前: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    mySwap(str1, str2);
    std::cout << "交换后: str1 = " << str1 << ", str2 = " << str2 << std::endl;

    // 将结果保存到一个随机命名的文件中
    std::string filename = generateRandomFileName(".txt");
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "交换后的值:\n";
        file << "x = " << x << "\n";
        file << "y = " << y << "\n";
        file << "str1 = " << str1 << "\n";
        file << "str2 = " << str2 << "\n";
        file.close();
        std::cout << "结果已保存到文件: " << filename << std::endl;
    } else {
        std::cerr << "无法创建文件: " << filename << std::endl;
    }

    return 0;
}