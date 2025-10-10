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

int main() {
    // 示例：交换两个整数
    int x = 5, y = 10;
    std::cout << "交换前: x = " << x << ", y = " << y << std::endl;
    mySwap(x, y);
    std::cout << "交换后: x = " << x << ", y = " << y << std::endl;

    // 示例：交换两个字符串
    std::string s1 = "Hello", s2 = "World";
    std::cout << "交换前: s1 = " << s1 << ", s2 = " << s2 << std::endl;
    mySwap(s1, s2);
    std::cout << "交换后: s1 = " << s1 << ", s2 = " << s2 << std::endl;

    // 生成随机文件名并保存代码
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(1, 10000);
    int random_num = dis(gen);
    std::string filename = "swap_code_" + std::to_string(random_num) + ".cpp";

    std::ofstream file(filename);
    if (file.is_open()) {
        file << "#include <iostream>\n#include <fstream>\n#include <string>\n#include <random>\n\n// 模板函数：交换两个变量的值\ntemplate<typename T>\nvoid mySwap(T& a, T& b) {\n    T temp = a;\n    a = b;\n    b = temp;\n}\n\nint main() {\n    // 示例：交换两个整数\n    int x = 5, y = 10;\n    std::cout << \"交换前: x = \" << x << \", y = \" << y << std::endl;\n    mySwap(x, y);\n    std::cout << \"交换后: x = \" << x << \", y = \" << y << std::endl;\n\n    // 示例：交换两个字符串\n    std::string s1 = \"Hello\", s2 = \"World\";\n    std::cout << \"交换前: s1 = \" << s1 << \", s2 = \" << s2 << std::endl;\n    mySwap(s1, s2);\n    std::cout << \"交换后: s1 = \" << s1 << \", s2 = \" << s2 << std::endl;\n\n    // 生成随机文件名并保存代码\n    std::random_device rd;\n    std::mt19937 gen(rd());\n    std::uniform_int_distribution<> dis(1, 10000);\n    int random_num = dis(gen);\n    std::string filename = \"swap_code_\" + std::to_string(random_num) + \".cpp\";\n\n    std::ofstream file(filename);\n    if (file.is_open()) {\n        file << \"Your code content here...\"; // 实际写入的内容是这个文件本身的源码\n        file.close();\n        std::cout << \"代码已保存到文件: \" << filename << std::endl;\n    } else {\n        std::cout << \"无法创建文件!\" << std::endl;\n    }\n\n    return 0;\n}";
        file.close();
        std::cout << "代码已保存到文件: " << filename << std::endl;
    } else {
        std::cout << "无法创建文件!" << std::endl;
    }

    return 0;
}