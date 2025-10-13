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

// 生成随机文件名的辅助函数
std::string generateRandomFileName(const std::string& extension = ".txt") {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, 999999);

    int randomNum = dis(gen);
    return "swap_result_" + std::to_string(randomNum) + extension;
}

int main() {
    // 示例：交换两个整数
    int x = 5;
    int y = 10;
    std::cout << "交换前: x = " << x << ", y = " << y << std::endl;

    mySwap(x, y);

    std::cout << "交换后: x = " << x << ", y = " << y << std::endl;

    // 将结果保存到随机命名的文件中
    std::string filename = generateRandomFileName(".txt");
    std::ofstream outFile(filename);
    if (outFile.is_open()) {
        outFile << "交换后的值:\n";
        outFile << "x = " << x << "\n";
        outFile << "y = " << y << "\n";
        outFile.close();
        std::cout << "结果已保存到文件: " << filename << std::endl;
    } else {
        std::cerr << "无法创建文件!" << std::endl;
        return 1;
    }

    return 0;
}