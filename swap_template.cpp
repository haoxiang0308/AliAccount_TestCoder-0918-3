#include <iostream>
#include <fstream>
#include <string>
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
    int x = 5;
    int y = 10;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    mySwap(x, y);
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;

    // Example usage with doubles
    double a = 3.14;
    double b = 9.81;
    std::cout << "Before swap: a = " << a << ", b = " << b << std::endl;
    mySwap(a, b);
    std::cout << "After swap: a = " << a << ", b = " << b << std::endl;

    // Save the code to a random file name
    std::string random_filename = "temp_code_" + std::to_string(rand()) + ".cpp";
    std::ofstream file(random_filename);
    if (file.is_open()) {
        file << "#include <iostream>\n";
        file << "#include <fstream>\n";
        file << "#include <string>\n";
        file << "#include <cstdlib> // For rand()\n\n";
        file << "// Template function to swap two variables\n";
        file << "template<typename T>\n";
        file << "void mySwap(T& a, T& b) {\n";
        file << "    T temp = a;\n";
        file << "    a = b;\n";
        file << "    b = temp;\n";
        file << "}\n\n";
        file << "int main() {\n";
        file << "    // Example usage with integers\n";
        file << "    int x = 5;\n";
        file << "    int y = 10;\n";
        file << "    std::cout << \"Before swap: x = \" << x << \", y = \" << y << std::endl;\n";
        file << "    mySwap(x, y);\n";
        file << "    std::cout << \"After swap: x = \" << x << \", y = \" << y << std::endl;\n\n";
        file << "    // Example usage with doubles\n";
        file << "    double a = 3.14;\n";
        file << "    double b = 9.81;\n";
        file << "    std::cout << \"Before swap: a = \" << a << \", b = \" << b << std::endl;\n";
        file << "    mySwap(a, b);\n";
        file << "    std::cout << \"After swap: a = \" << a << \", b = \" << b << std::endl;\n\n";
        file << "    return 0;\n";
        file << "}\n";
        file.close();
        std::cout << "Code saved to random file: " << random_filename << std::endl;
    } else {
        std::cerr << "Could not open file for writing." << std::endl;
    }

    return 0;
}