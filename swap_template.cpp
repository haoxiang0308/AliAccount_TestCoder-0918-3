#include <iostream>
#include <string>
#include <fstream>
#include <cstdlib> // For rand()

// 模板函数：交换两个变量的值
template<typename T>
void mySwap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

int main() {
    // 示例：交换两个整数
    int x = 10;
    int y = 20;
    std::cout << "交换前: x = " << x << ", y = " << y << std::endl;
    mySwap(x, y);
    std::cout << "交换后: x = " << x << ", y = " << y << std::endl;

    // 示例：交换两个字符串
    std::string str1 = "Hello";
    std::string str2 = "World";
    std::cout << "交换前: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    mySwap(str1, str2);
    std::cout << "交换后: str1 = " << str1 << ", str2 = " << str2 << std::endl;

    // 生成随机文件名并保存代码
    std::string random_filename = "swap_code_" + std::to_string(rand()) + ".cpp";
    std::ofstream file(random_filename);
    if (file.is_open()) {
        file << "#include <iostream>\n#include <string>\n#include <fstream>\n#include <cstdlib> // For rand()\n\n// 模板函数：交换两个变量的值\ntemplate<typename T>\nvoid mySwap(T& a, T& b) {\n    T temp = a;\n    a = b;\n    b = temp;\n}\n\nint main() {\n    // 示例：交换两个整数\n    int x = 10;\n    int y = 20;\n    std::cout << \"交换前: x = \" << x << \", y = \" << y << std::endl;\n    mySwap(x, y);\n    std::cout << \"交换后: x = \" << x << \", y = \" << y << std::endl;\n\n    // 示例：交换两个字符串\n    std::string str1 = \"Hello\";\n    std::string str2 = \"World\";\n    std::cout << \"交换前: str1 = \" << str1 << \", str2 = \" << str2 << std::endl;\n    mySwap(str1, str2);\n    std::cout << \"交换后: str1 = \" << str1 << \", str2 = \" << str2 << std::endl;\n\n    return 0;\n}";
        file.close();
        std::cout << "代码已保存到随机命名的文件: " << random_filename << std::endl;
    } else {
        std::cerr << "无法创建随机命名的文件!" << std::endl;
    }

    return 0;
}