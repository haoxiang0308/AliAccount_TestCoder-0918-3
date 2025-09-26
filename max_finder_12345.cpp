#include <iostream>
#include <vector>
#include <algorithm>

int main() {
    // Пример массива
    std::vector<int> numbers = {3, 7, 2, 9, 1, 5};

    // Проверка на пустой массив
    if (numbers.empty()) {
        std::cout << "Массив пуст." << std::endl;
        return 1;
    }

    // Нахождение максимального элемента
    auto max_it = std::max_element(numbers.begin(), numbers.end());

    std::cout << "Максимальное число в массиве: " << *max_it << std::endl;

    return 0;
}