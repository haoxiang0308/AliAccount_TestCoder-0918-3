#include <iostream>
#include <vector>
#include <algorithm>
#include <climits>

int main() {
    // Пример массива чисел
    std::vector<int> numbers = {3, 5, 7, 2, 8, -1, 4, 10, 12};
    
    // Проверка на пустой массив
    if (numbers.empty()) {
        std::cout << "Массив пуст." << std::endl;
        return 1;
    }
    
    // Нахождение максимального элемента с помощью std::max_element
    auto maxElement = std::max_element(numbers.begin(), numbers.end());
    
    // Вывод результата
    std::cout << "Максимальное число в массиве: " << *maxElement << std::endl;
    
    return 0;
}