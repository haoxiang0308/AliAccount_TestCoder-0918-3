#include <iostream>
#include <string>
#include <fstream>
#include <cstdlib> // For rand()

// Template function to swap two variables
template<typename T>
void mySwap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

int main() {
    // Example usage with integers
    int x = 10;
    int y = 20;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    mySwap(x, y);
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;

    // Example usage with strings
    std::string str1 = "Hello";
    std::string str2 = "World";
    std::cout << "Before swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    mySwap(str1, str2);
    std::cout << "After swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;

    // Save the code to a randomly named file
    std::string random_filename = "temp_swap_code_" + std::to_string(rand()) + ".cpp";
    std::ofstream file(random_filename);
    if (file.is_open()) {
        file << "#include <iostream>\n#include <string>\n#include <fstream>\n#include <cstdlib> // For rand()\n\n// Template function to swap two variables\ntemplate<typename T>\nvoid mySwap(T& a, T& b) {\n    T temp = a;\n    a = b;\n    b = temp;\n}\n\nint main() {\n    // Example usage with integers\n    int x = 10;\n    int y = 20;\n    std::cout << \"Before swap: x = \" << x << \", y = \" << y << std::endl;\n    mySwap(x, y);\n    std::cout << \"After swap: x = \" << x << \", y = \" << y << std::endl;\n\n    // Example usage with strings\n    std::string str1 = \"Hello\";\n    std::string str2 = \"World\";\n    std::cout << \"Before swap: str1 = \" << str1 << \", str2 = \" << str2 << std::endl;\n    mySwap(str1, str2);\n    std::cout << \"After swap: str1 = \" << str1 << \", str2 = \" << str2 << std::endl;\n\n    // Save the code to a randomly named file\n    // This part is handled by the outer program logic\n    return 0;\n}\n";
        file.close();
        std::cout << "Code saved to randomly named file: " << random_filename << std::endl;
    } else {
        std::cerr << "Error: Could not create the random file." << std::endl;
        return 1; // Exit with error code
    }

    return 0;
}