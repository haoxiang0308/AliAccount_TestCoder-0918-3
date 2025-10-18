#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>

int main() {
    // Определение массива целых чисел
    std::vector<int> numbers = {3, 5, 7, 2, 8, 6, 4};

    // Нахождение максимального значения в массиве
    int max_value = *std::max_element(numbers.begin(), numbers.end());

    // Генерация случайного имени файла
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(10000, 99999); // Генерация случайного числа для имени файла
    std::string filename = "max_result_" + std::to_string(dis(gen)) + ".txt";

    // Открытие файла для записи
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Максимальное значение: " << max_value << std::endl;
        file.close();
        std::cout << "Максимальное значение " << max_value << " сохранено в файл " << filename << std::endl;
    } else {
        std::cerr << "Не удалось открыть файл для записи!" << std::endl;
        return 1;
    }

    return 0;
}