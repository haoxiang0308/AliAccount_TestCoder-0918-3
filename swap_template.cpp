#include <iostream>
#include <fstream>
#include <string>
#include <random>

// 模板函数：交换两个变量的值
template<typename T>
void swap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

int main() {
    // 示例：交换两个整数
    int x = 5;
    int y = 10;
    std::cout << "交换前: x = " << x << ", y = " << y << std::endl;
    swap(x, y);
    std::cout << "交换后: x = " << x << ", y = " << y << std::endl;

    // 生成随机文件名
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(1, 10000);
    std::string filename = "swap_result_" + std::to_string(dis(gen)) + ".txt";

    // 将结果写入随机命名的文件
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "交换后的值: x = " << x << ", y = " << y << std::endl;
        file.close();
        std::cout << "结果已保存到文件: " << filename << std::endl;
    } else {
        std::cerr << "无法创建文件: " << filename << std::endl;
    }

    return 0;
}